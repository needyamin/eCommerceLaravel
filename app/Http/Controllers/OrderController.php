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
}
