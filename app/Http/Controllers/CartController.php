<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Support\Str;

class CartController extends Controller
{
	protected function currentCart(Request $request): Cart
	{
		$sessionId = $request->session()->get('cart_session_id');
		if (!$sessionId) {
			$sessionId = (string) Str::uuid();
			$request->session()->put('cart_session_id', $sessionId);
		}
		
		// If user is authenticated, try to find their cart first
		if (auth()->check()) {
			$cart = Cart::where('user_id', auth()->id())->first();
			if ($cart) {
				return $cart;
			}
		}
		
		// Otherwise, use session-based cart
		return Cart::firstOrCreate([
			'session_id' => $sessionId,
		], [
			'user_id' => auth()->id(),
		]);
	}

	public function index(Request $request)
	{
		$cart = $this->currentCart($request)->load('items.product');
		return view('cart.index', compact('cart'));
	}

	public function add(Request $request)
	{
		$request->validate([
			'product_id' => ['required', 'exists:products,id'],
			'quantity' => ['nullable', 'integer', 'min:1'],
		]);
		$cart = $this->currentCart($request);
		$product = Product::findOrFail($request->integer('product_id'));
		$quantity = max(1, (int) $request->input('quantity', 1));
        $item = CartItem::firstOrNew([
			'cart_id' => $cart->id,
			'product_id' => $product->id,
		]);
        $alreadyExisted = $item->exists;
        $item->quantity = ($alreadyExisted ? $item->quantity : 0) + $quantity;
		$item->unit_price = $product->price;
		$item->line_total = $item->quantity * $item->unit_price;
		$item->save();
        $this->recalculateTotals($cart);
        if ($request->wantsJson()) {
            $count = CartItem::where('cart_id', $cart->id)->sum('quantity');
            return response()->json([
                'success' => true,
                'message' => $alreadyExisted ? 'Item already in cart. Quantity updated.' : 'Added to cart',
                'item' => [
                    'id' => $item->id,
                    'quantity' => $item->quantity,
                    'line_total' => (float) $item->line_total,
                ],
                'cart' => [
                    'count' => (int) $count,
                    'subtotal' => (float) $cart->subtotal,
                    'grand_total' => (float) $cart->grand_total,
                ],
            ]);
        }
        return redirect()->back()->with('success', $alreadyExisted ? 'Item already in cart. Quantity updated.' : 'Added to cart');
	}

	public function update(Request $request, CartItem $item)
	{
		$request->validate([
			'quantity' => ['required', 'integer', 'min:1'],
		]);
		$item->quantity = (int) $request->input('quantity');
		$item->line_total = $item->quantity * $item->unit_price;
		$item->save();
        $this->recalculateTotals($item->cart);
        if ($request->wantsJson()) {
            $count = CartItem::where('cart_id', $item->cart_id)->sum('quantity');
            return response()->json([
                'success' => true,
                'message' => 'Cart updated',
                'item' => [
                    'id' => $item->id,
                    'quantity' => $item->quantity,
                    'line_total' => (float) $item->line_total,
                ],
                'cart' => [
                    'count' => (int) $count,
                    'subtotal' => (float) $item->cart->subtotal,
                    'grand_total' => (float) $item->cart->grand_total,
                ],
            ]);
        }
        return redirect()->back()->with('success', 'Cart updated');
	}

	public function remove(Request $request, CartItem $item)
	{
		$cart = $item->cart;
		$item->delete();
        $this->recalculateTotals($cart);
        if ($request->wantsJson()) {
            $count = CartItem::where('cart_id', $cart->id)->sum('quantity');
            return response()->json([
                'success' => true,
                'message' => 'Item removed',
                'cart' => [
                    'count' => (int) $count,
                    'subtotal' => (float) $cart->subtotal,
                    'grand_total' => (float) $cart->grand_total,
                ],
            ]);
        }
        return redirect()->back()->with('success', 'Item removed');
	}

	protected function recalculateTotals(Cart $cart): void
	{
		$cart->recalculateTotals();
	}
}
