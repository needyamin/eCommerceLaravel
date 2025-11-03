<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use App\Support\CurrencyManager;
use App\Models\ShippingSetting;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $perPage = (int) $request->input('per_page', 20);
        if ($perPage < 1) { $perPage = 20; }
        if ($perPage > 100) { $perPage = 100; }
        $orders = Order::where('user_id', $request->user()->id)
            ->latest()
            ->paginate($perPage);
        $data = $orders->getCollection()->map(fn ($o) => $this->orderSummary($o));
        return response()->json([
            'data' => $data,
            'meta' => [
                'current_page' => $orders->currentPage(),
                'last_page' => $orders->lastPage(),
                'per_page' => $orders->perPage(),
                'total' => $orders->total(),
            ],
        ]);
    }

    public function show(Request $request, int $id)
    {
        $order = Order::with('items.product')
            ->where('user_id', $request->user()->id)
            ->findOrFail($id);
        return response()->json($this->orderResource($order));
    }

    public function place(Request $request)
    {
        $request->validate([
            'billing_name' => ['required','string','max:255'],
            'billing_email' => ['required','email'],
            'gateway' => ['required','in:stripe,paypal,cod'],
        ]);

        $cart = Cart::where('user_id', $request->user()->id)->with('items.product')->first();
        if (!$cart || $cart->items->isEmpty()) {
            return response()->json(['message' => 'Your cart is empty.'], 422);
        }
        foreach ($cart->items as $ci) {
            if (!$ci->product || !$ci->product->is_active || (int) $ci->product->stock <= 0) {
                return response()->json(['message' => 'Some items are out of stock.'], 422);
            }
            if ($ci->quantity > (int) $ci->product->stock) {
                return response()->json(['message' => 'Some item quantities exceed stock.'], 422);
            }
        }

        $order = new Order();
        $order->fill($request->only([
            'billing_name', 'billing_email', 'billing_phone', 'billing_address', 'billing_city', 'billing_postcode', 'billing_country',
            'shipping_name', 'shipping_phone', 'shipping_address', 'shipping_city', 'shipping_postcode', 'shipping_country',
        ]));
        $order->number = strtoupper(Str::random(10));
        $order->user_id = $request->user()->id;
        $order->status = 'pending';
        $order->subtotal = $cart->subtotal;
        $order->discount_total = $cart->discount_total;
        $order->tax_total = $cart->tax_total;
        $shipping = 0.0;
        try {
            $s = ShippingSetting::get();
            if ($s->enabled) {
                $shipping = (float) ($s->flat_rate ?? 0);
            }
        } catch (\Throwable $e) {}
        $order->shipping_total = $shipping;
        $order->grand_total = (float) $order->subtotal - (float) $order->discount_total + (float) $order->tax_total + (float) $order->shipping_total;
        $order->currency = CurrencyManager::current()->code;
        $order->payment_method = $request->string('gateway');
        $order->payment_status = 'unpaid';
        $order->shipping_status = 'unshipped';
        $order->save();

        foreach ($cart->items as $cartItem) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $cartItem->product_id,
                'product_name' => $cartItem->product->name,
                'product_sku' => $cartItem->product->sku,
                'quantity' => $cartItem->quantity,
                'unit_price' => $cartItem->unit_price,
                'line_total' => $cartItem->line_total,
            ]);
        }

        $cart->items()->delete();
        $cart->delete();

        return response()->json($this->orderResource($order->load('items.product')), 201);
    }

    private function money(float $amount): array
    {
        return [
            'amount' => $amount,
            'formatted' => CurrencyManager::format($amount),
        ];
    }

    private function orderSummary(Order $o): array
    {
        return [
            'id' => $o->id,
            'number' => $o->number,
            'status' => $o->status,
            'grand_total' => $this->money((float) $o->grand_total),
            'created_at' => $o->created_at?->toIso8601String(),
        ];
    }

    private function orderResource(Order $o): array
    {
        return [
            'id' => $o->id,
            'number' => $o->number,
            'status' => $o->status,
            'payment_status' => $o->payment_status,
            'shipping_status' => $o->shipping_status,
            'totals' => [
                'subtotal' => $this->money((float) $o->subtotal),
                'discount_total' => $this->money((float) $o->discount_total),
                'tax_total' => $this->money((float) $o->tax_total),
                'shipping_total' => $this->money((float) $o->shipping_total),
                'grand_total' => $this->money((float) $o->grand_total),
            ],
            'currency' => $o->currency,
            'items' => $o->items->map(function ($it) {
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
            'billing' => [
                'name' => $o->billing_name,
                'email' => $o->billing_email,
                'phone' => $o->billing_phone,
                'address' => $o->billing_address,
                'city' => $o->billing_city,
                'postcode' => $o->billing_postcode,
                'country' => $o->billing_country,
            ],
            'shipping' => [
                'name' => $o->shipping_name,
                'phone' => $o->shipping_phone,
                'address' => $o->shipping_address,
                'city' => $o->shipping_city,
                'postcode' => $o->shipping_postcode,
                'country' => $o->shipping_country,
            ],
            'created_at' => $o->created_at?->toIso8601String(),
        ];
    }
}


