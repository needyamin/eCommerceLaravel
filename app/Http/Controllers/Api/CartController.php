<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use App\Support\CurrencyManager;

class CartController extends Controller
{
    public function show(Request $request)
    {
        try {
            [$cart, $cartSession] = $this->getOrCreateCart($request);
            $cart->load('items.product');
            return response()->json($this->cartResource($cart, $cartSession));
        } catch (\Throwable $e) {
            Log::error('API Get cart error: ' . $e->getMessage(), [
                'exception' => $e,
            ]);
            
            return response()->json([
                'message' => 'An error occurred while retrieving cart. Please try again.',
                'error' => 'INTERNAL_ERROR'
            ], 500);
        }
    }

    public function add(Request $request)
    {
        try {
            $request->validate([
                'product_id' => ['required','exists:products,id'],
                'quantity' => ['nullable','integer','min:1'],
            ]);
            
            [$cart] = $this->getOrCreateCart($request);
            $product = Product::where('id', $request->integer('product_id'))
                ->where('is_active', true)->firstOrFail();
            
            // Check stock availability
            $availableStock = (int) $product->stock;
            if ($availableStock <= 0) {
                return response()->json([
                    'message' => 'Product is out of stock',
                    'error' => 'OUT_OF_STOCK'
                ], 422);
            }
            
            $qty = max(1, (int) $request->input('quantity', 1));
            $qty = min($qty, $availableStock);
            
            $existing = CartItem::where('cart_id', $cart->id)->where('product_id', $product->id)->first();
            if ($existing) {
                // Calculate new quantity and ensure it doesn't exceed stock
                $newQuantity = min($availableStock, $existing->quantity + $qty);
                $existing->quantity = $newQuantity;
                $existing->line_total = $existing->quantity * (float) $existing->unit_price;
                $existing->save();
            } else {
                CartItem::create([
                    'cart_id' => $cart->id,
                    'product_id' => $product->id,
                    'quantity' => $qty,
                    'unit_price' => (float) $product->price,
                    'line_total' => (float) $product->price * $qty,
                ]);
            }
            
            $cart->recalculateTotals();
            $cart->load('items.product');
            return response()->json($this->cartResource($cart));
            
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'message' => 'Product not found or not available',
                'error' => 'PRODUCT_NOT_FOUND'
            ], 404);
        } catch (\Throwable $e) {
            Log::error('API Add to cart error: ' . $e->getMessage(), [
                'exception' => $e,
                'request' => $request->all(),
            ]);
            
            return response()->json([
                'message' => 'An error occurred while adding item to cart. Please try again.',
                'error' => 'INTERNAL_ERROR'
            ], 500);
        }
    }

    public function update(Request $request, CartItem $item)
    {
        try {
            $request->validate([
                'quantity' => ['required','integer','min:1'],
            ]);
            
            $product = $item->product;
            if (!$product || !$product->is_active) {
                return response()->json([
                    'message' => 'Product is not available',
                    'error' => 'PRODUCT_UNAVAILABLE'
                ], 422);
            }
            
            $availableStock = (int) $product->stock;
            if ($availableStock <= 0) {
                return response()->json([
                    'message' => 'Product is out of stock',
                    'error' => 'OUT_OF_STOCK'
                ], 422);
            }
            
            $qty = (int) $request->input('quantity');
            $qty = min($qty, $availableStock);
            
            $item->quantity = $qty;
            $item->line_total = $qty * (float) $item->unit_price;
            $item->save();
            $item->cart->recalculateTotals();
            $item->cart->load('items.product');
            return response()->json($this->cartResource($item->cart));
            
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validation failed',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            Log::error('API Update cart item error: ' . $e->getMessage(), [
                'exception' => $e,
                'request' => $request->all(),
            ]);
            
            return response()->json([
                'message' => 'An error occurred while updating cart item. Please try again.',
                'error' => 'INTERNAL_ERROR'
            ], 500);
        }
    }

    public function remove(Request $request, CartItem $item)
    {
        try {
            $cart = $item->cart;
            $item->delete();
            $cart->recalculateTotals();
            $cart->load('items.product');
            return response()->json($this->cartResource($cart));
        } catch (\Throwable $e) {
            Log::error('API Remove cart item error: ' . $e->getMessage(), [
                'exception' => $e,
            ]);
            
            return response()->json([
                'message' => 'An error occurred while removing cart item. Please try again.',
                'error' => 'INTERNAL_ERROR'
            ], 500);
        }
    }

    public function clear(Request $request)
    {
        try {
            [$cart] = $this->getOrCreateCart($request);
            $cart->items()->delete();
            $cart->recalculateTotals();
            return response()->json($this->cartResource($cart));
        } catch (\Throwable $e) {
            Log::error('API Clear cart error: ' . $e->getMessage(), [
                'exception' => $e,
            ]);
            
            return response()->json([
                'message' => 'An error occurred while clearing cart. Please try again.',
                'error' => 'INTERNAL_ERROR'
            ], 500);
        }
    }

    private function getOrCreateCart(Request $request): array
    {
        $userId = auth()->id();
        $session = (string) $request->header('X-Cart-Session', '');
        
        if ($userId) {
            // For authenticated users, create user-based cart
            $cart = Cart::firstOrCreate(
                ['user_id' => $userId],
                [
                    'session_id' => null,
                    'subtotal' => 0,
                    'discount_total' => 0,
                    'tax_total' => 0,
                    'grand_total' => 0,
                    'coupon_discount' => 0,
                ]
            );
            return [$cart, null];
        }
        
        // For guests, use session-based cart
        if ($session === '') {
            $session = (string) Str::uuid();
        }
        $cart = Cart::firstOrCreate(
            ['session_id' => $session],
            [
                'user_id' => null,
                'subtotal' => 0,
                'discount_total' => 0,
                'tax_total' => 0,
                'grand_total' => 0,
                'coupon_discount' => 0,
            ]
        );
        return [$cart, $session];
    }

    private function money(float $amount): array
    {
        return [
            'amount' => $amount,
            'formatted' => CurrencyManager::format($amount),
        ];
    }

    private function cartResource(Cart $cart, ?string $cartSession = null): array
    {
        return [
            'cart_session' => $cartSession,
            'items' => $cart->items->map(function ($it) {
                return [
                    'id' => $it->id,
                    'product' => $it->product ? [
                        'id' => $it->product->id,
                        'name' => $it->product->name,
                        'slug' => $it->product->slug,
                        'sku' => $it->product->sku,
                    ] : null,
                    'quantity' => (int) $it->quantity,
                    'unit_price' => $this->money((float) $it->unit_price),
                    'line_total' => $this->money((float) $it->line_total),
                ];
            }),
            'totals' => [
                'subtotal' => $this->money((float) $cart->subtotal),
                'discount_total' => $this->money((float) $cart->discount_total),
                'tax_total' => $this->money((float) $cart->tax_total),
                'grand_total' => $this->money((float) $cart->grand_total),
            ],
        ];
    }
}


