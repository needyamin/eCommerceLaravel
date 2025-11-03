<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use App\Support\CurrencyManager;

class CartController extends Controller
{
    public function show(Request $request)
    {
        [$cart, $cartSession] = $this->getOrCreateCart($request);
        $cart->load('items.product');
        return response()->json($this->cartResource($cart, $cartSession));
    }

    public function add(Request $request)
    {
        $request->validate([
            'product_id' => ['required','exists:products,id'],
            'quantity' => ['nullable','integer','min:1'],
        ]);
        [$cart] = $this->getOrCreateCart($request);
        $product = Product::where('id', $request->integer('product_id'))
            ->where('is_active', true)->firstOrFail();
        $qty = max(1, (int) $request->input('quantity', 1));
        $qty = min($qty, (int) $product->stock);
        $existing = CartItem::where('cart_id', $cart->id)->where('product_id', $product->id)->first();
        if ($existing) {
            $existing->quantity = min((int) $product->stock, $existing->quantity + $qty);
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
    }

    public function update(Request $request, CartItem $item)
    {
        $request->validate([
            'quantity' => ['required','integer','min:1'],
        ]);
        $qty = (int) $request->input('quantity');
        $product = $item->product;
        if (!$product || !$product->is_active || (int) $product->stock <= 0) {
            return response()->json(['message' => 'Product unavailable'], 422);
        }
        $qty = min($qty, (int) $product->stock);
        $item->quantity = $qty;
        $item->line_total = $qty * (float) $item->unit_price;
        $item->save();
        $item->cart->recalculateTotals();
        $item->cart->load('items.product');
        return response()->json($this->cartResource($item->cart));
    }

    public function remove(Request $request, CartItem $item)
    {
        $cart = $item->cart;
        $item->delete();
        $cart->recalculateTotals();
        $cart->load('items.product');
        return response()->json($this->cartResource($cart));
    }

    public function clear(Request $request)
    {
        [$cart] = $this->getOrCreateCart($request);
        $cart->items()->delete();
        $cart->recalculateTotals();
        return response()->json($this->cartResource($cart));
    }

    private function getOrCreateCart(Request $request): array
    {
        $userId = auth()->id();
        $session = (string) $request->header('X-Cart-Session', '');
        if ($userId) {
            $cart = Cart::firstOrCreate(['user_id' => $userId]);
            return [$cart, null];
        }
        if ($session === '') {
            $session = (string) Str::uuid();
        }
        $cart = Cart::firstOrCreate(['session_id' => $session]);
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


