<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Notifications\OrderConfirmation;
use Illuminate\Support\Str;
use App\Http\Controllers\PaymentGateway\PaymentGatewayManager;
use App\Support\PointService;
use App\Models\CoinSetting;
use App\Models\ShippingSetting;

class CheckoutController extends Controller
{
    protected function findCurrentCart(Request $request): ?Cart
    {
        $query = Cart::query()->with('items.product', 'coupon');
        $sessionId = $request->session()->get('cart_session_id');
        if (auth()->check()) {
            $cart = (clone $query)->where('user_id', auth()->id())->first();
            if ($cart) {
                return $cart;
            }
        }
        if ($sessionId) {
            return (clone $query)->where('session_id', $sessionId)->first();
        }
        return null;
    }

    public function show(Request $request)
    {
        $cart = $this->findCurrentCart($request);

        if (!$cart) {
            return redirect()->route('cart.index')->with('error', 'Your cart is empty.');
        }

        // Block showing checkout if any item is out of stock/inactive or exceeds stock
        foreach ($cart->items as $ci) {
            if (!$ci->product || !$ci->product->is_active || (int) $ci->product->stock <= 0) {
                return redirect()->route('cart.index')->with('error', 'Some items are out of stock and have been moved to the Unavailable section. Please remove them to continue.');
            }
            if ($ci->quantity > (int) $ci->product->stock) {
                return redirect()->route('cart.index')->with('error', 'Some item quantities exceed stock. Please adjust to continue.');
            }
        }

        $gatewayManager = new PaymentGatewayManager();
        $enabledGateways = $gatewayManager->getEnabledGateways();

        // Compute shipping based on settings (country + optional city)
        $shippingSettings = ShippingSetting::get();
        $shipping = 0.0;
        if ($shippingSettings->enabled) {
            if ($shippingSettings->free_shipping_enabled && $cart->grand_total >= (float) $shippingSettings->free_shipping_min_total) {
                $shipping = 0.0;
            } else {
                $country = (string) (old('billing_country') ?: 'United States');
                $city = trim((string) old('billing_city', ''));
                $rates = (array) ($shippingSettings->country_rates ?? []);
                // Prefer city match within country, else country-only match
                $found = null; $foundCountryOnly = null;
                foreach ($rates as $conf) {
                    if (!is_array($conf)) continue;
                    $c = $conf['country'] ?? null; $ci = trim((string) ($conf['city'] ?? ''));
                    if ($c && strcasecmp($c, $country) === 0) {
                        if ($ci !== '' && $city !== '' && strcasecmp($ci, $city) === 0) { $found = $conf; break; }
                        if ($ci === '') { $foundCountryOnly = $conf; }
                    }
                }
                if (!$found && $foundCountryOnly) { $found = $foundCountryOnly; }
                if ($found) {
                    $type = $found['type'] ?? 'flat';
                    $amount = (float) ($found['amount'] ?? 0);
                    if ($type === 'percent') {
                        $shipping = round(($cart->subtotal) * ($amount/100), 2);
                    } else {
                        $shipping = $amount;
                    }
                } else if ($shippingSettings->global_rate_enabled) {
                    $type = $shippingSettings->global_rate_type ?? 'flat';
                    $amount = (float) ($shippingSettings->global_rate_amount ?? 0);
                    $shipping = ($type === 'percent') ? round(($cart->subtotal) * ($amount/100), 2) : $amount;
                }
            }
        }

        return view('checkout.show', [
            'cart' => $cart,
            'gateways' => $enabledGateways,
            'shipping' => $shipping,
        ]);
    }

    public function place(Request $request)
    {
        $request->validate([
            'billing_name' => ['required', 'string', 'max:255'],
            'billing_email' => ['required', 'email'],
            'gateway' => ['required', 'in:stripe,paypal,cod'],
        ]);
        $cart = $this->findCurrentCart($request);
        if (!$cart || $cart->items->isEmpty()) {
            return redirect()->route('cart.index')->with('error', 'Your cart is empty.');
        }
        // Block checkout if any item is out of stock or inactive
        foreach ($cart->items as $ci) {
            if (!$ci->product || !$ci->product->is_active || (int) $ci->product->stock <= 0) {
                return redirect()->route('cart.index')->with('error', 'Some items are out of stock and have been disabled. Please remove them to continue.');
            }
            if ($ci->quantity > (int) $ci->product->stock) {
                return redirect()->route('cart.index')->with('error', 'Some item quantities exceed stock. Please adjust to continue.');
            }
        }

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
        // Recompute shipping on submission using same logic as show()
        $shippingSettings = ShippingSetting::get();
        $shipping = 0.0;
        if ($shippingSettings->enabled) {
            if ($shippingSettings->free_shipping_enabled && $cart->grand_total >= (float) $shippingSettings->free_shipping_min_total) {
                $shipping = 0.0;
            } else {
                $country = (string) $request->string('billing_country') ?: 'United States';
                $city = trim((string) $request->string('billing_city') ?: '');
                $rates = (array) ($shippingSettings->country_rates ?? []);
                $found = null; $foundCountryOnly = null;
                foreach ($rates as $conf) {
                    if (!is_array($conf)) continue;
                    $c = $conf['country'] ?? null; $ci = trim((string) ($conf['city'] ?? ''));
                    if ($c && strcasecmp($c, $country) === 0) {
                        if ($ci !== '' && $city !== '' && strcasecmp($ci, $city) === 0) { $found = $conf; break; }
                        if ($ci === '') { $foundCountryOnly = $conf; }
                    }
                }
                if (!$found && $foundCountryOnly) { $found = $foundCountryOnly; }
                if ($found) {
                    $type = $found['type'] ?? 'flat';
                    $amount = (float) ($found['amount'] ?? 0);
                    if ($type === 'percent') {
                        $shipping = round(($cart->subtotal) * ($amount/100), 2);
                    } else {
                        $shipping = $amount;
                    }
                } else if ($shippingSettings->global_rate_enabled) {
                    $type = $shippingSettings->global_rate_type ?? 'flat';
                    $amount = (float) ($shippingSettings->global_rate_amount ?? 0);
                    $shipping = ($type === 'percent') ? round(($cart->subtotal) * ($amount/100), 2) : $amount;
                }
            }
        }
        $order->shipping_total = $shipping;
        $order->grand_total = $cart->grand_total + $shipping;
		$order->currency = 'USD';
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
		$request->session()->forget('cart_session_id');

		// Send order confirmation email
		if ($order->user) {
			$order->user->notify(new OrderConfirmation($order));
			try {
				$ratePer = 100; $rateCoins = 1; $minAward = 1; $codBonus = 0; $enableOrder = true; $enableCod = true; $enableAll = true;
				try {
					$cs = CoinSetting::get();
					$enableAll = (bool) ($cs->coins_enabled ?? true);
					$enableOrder = (bool) ($cs->order_award_enabled ?? true);
					$enableCod = (bool) ($cs->cod_bonus_enabled ?? true);
					$ratePer = (int) max(1, (int) ($cs->order_rate_per ?? 100));
					$rateCoins = (int) max(0, (int) ($cs->order_rate_coins ?? 1));
					$minAward = (int) max(0, (int) ($cs->order_min_award ?? 1));
					$codBonus = (int) max(0, (int) ($cs->cod_bonus ?? 0));
				} catch (\Throwable $e) {}
				if ($enableAll && $enableOrder) {
					$steps = (int) floor(((float) $order->grand_total) / $ratePer);
					$award = max($minAward, $steps * $rateCoins);
					if ($award > 0) {
						PointService::award($order->user, $award, 'order_place', 'Order placed', $order, ['order_id' => $order->id]);
					}
				}
				if ($enableAll && $enableCod && $order->payment_method === 'cod' && $codBonus > 0) {
					PointService::award($order->user, $codBonus, 'cod_choice', 'Chose COD', $order);
				}
			} catch (\Throwable $e) {
				// swallow
			}
		}

		return redirect()->route('orders.show', $order->id)->with('success', 'Order placed');
	}
}
