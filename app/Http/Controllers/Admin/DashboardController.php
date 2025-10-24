<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Product;
use App\Models\Category;
use App\Models\User;

class DashboardController extends Controller
{
	public function index()
	{
		$stats = [
			'orders' => Order::count(),
			'products' => Product::count(),
			'categories' => Category::count(),
			'customers' => User::count(),
			'revenue' => (float) Order::sum('grand_total'),
		];

		$fromDate = now()->subDays(14)->startOfDay();
		$series = Order::selectRaw('DATE(created_at) as d, COUNT(*) as orders, SUM(grand_total) as revenue')
			->where('created_at', '>=', $fromDate)
			->groupBy('d')
			->orderBy('d')
			->get();
		$labels = [];
		$ordersSeries = [];
		$revenueSeries = [];
		$cursor = (clone $fromDate)->startOfDay();
		$map = $series->keyBy('d');
		while ($cursor->lte(now())) {
			$key = $cursor->toDateString();
			$labels[] = $cursor->format('M d');
			$ordersSeries[] = (int) ($map[$key]->orders ?? 0);
			$revenueSeries[] = (float) ($map[$key]->revenue ?? 0);
			$cursor->addDay();
		}

		$recentOrders = Order::latest()->take(5)->get();
		$lowStock = Product::where('stock', '<=', 5)->orderBy('stock')->take(5)->get();

		return view('admin.dashboard', compact('stats', 'labels', 'ordersSeries', 'revenueSeries', 'recentOrders', 'lowStock'));
	}
}
