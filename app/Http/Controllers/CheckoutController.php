<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Notifications\OrderConfirmation;
use Illuminate\Support\Str;
use App\Http\Controllers\PaymentGateway\PaymentGatewayManager;

class CheckoutController extends Controller
{
    public function show(Request $request)
    {
        $cart = Cart::where('session_id', $request->session()->get('cart_session_id'))
            ->with('items.product', 'coupon')
            ->firstOrFail();

        $gatewayManager = new PaymentGatewayManager();
        $enabledGateways = $gatewayManager->getEnabledGateways();

        return view('checkout.show', [
            'cart' => $cart,
            'gateways' => $enabledGateways,
        ]);
    }

	public function place(Request $request)
	{
        $request->validate([
            'billing_name' => ['required', 'string', 'max:255'],
            'billing_email' => ['required', 'email'],
            'gateway' => ['required', 'in:stripe,paypal'],
        ]);
		$cart = Cart::where('session_id', $request->session()->get('cart_session_id'))
			->with('items.product')
			->firstOrFail();

		$order = new Order();
		$order->fill($request->only([
			'billing_name', 'billing_email', 'billing_phone', 'billing_address', 'billing_city', 'billing_postcode', 'billing_country',
			'shipping_name', 'shipping_phone', 'shipping_address', 'shipping_city', 'shipping_postcode', 'shipping_country',
		]));
		$order->number = strtoupper(Str::random(10));
		$order->user_id = auth()->id();
		$order->status = 'pending';
		$order->subtotal = $cart->subtotal;
		$order->discount_total = $cart->discount_total;
		$order->tax_total = $cart->tax_total;
		$order->shipping_total = 0;
		$order->grand_total = $cart->grand_total;
		$order->currency = 'USD';
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
		$request->session()->forget('cart_session_id');

		// Send order confirmation email
		if ($order->user) {
			$order->user->notify(new OrderConfirmation($order));
		}

		return redirect()->route('orders.show', $order->id)->with('success', 'Order placed');
	}
}
