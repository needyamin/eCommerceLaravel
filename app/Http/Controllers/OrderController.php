<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;

class OrderController extends Controller
{
	public function index()
	{
		$orders = Order::where('user_id', auth()->id())
			->latest()
			->paginate(20);
		return view('orders.index', compact('orders'));
	}

	public function show(int $id)
	{
		$order = Order::with('items.product')
			->where('user_id', auth()->id())
			->findOrFail($id);
		return view('orders.show', compact('order'));
	}

    public function showGuest(Order $order)
    {
        // Allow only guest orders (no user) via signed URL
        abort_if(!is_null($order->user_id), 403);
        $order->load('items.product');
        return view('orders.show', compact('order'));
    }
}
