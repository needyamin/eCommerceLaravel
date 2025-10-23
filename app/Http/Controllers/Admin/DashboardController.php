<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Product;
use App\Models\Category;

class DashboardController extends Controller
{
	public function index()
	{
		$stats = [
			'orders' => Order::count(),
			'products' => Product::count(),
			'categories' => Category::count(),
		];
		return view('admin.dashboard', compact('stats'));
	}
}
