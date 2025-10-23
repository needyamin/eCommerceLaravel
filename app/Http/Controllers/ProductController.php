<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;

class ProductController extends Controller
{
	public function index(Request $request)
	{
		$query = Product::query()->with('images', 'category')->where('is_active', true);
		if ($search = $request->get('q')) {
			$query->where(function ($q) use ($search) {
				$q->where('name', 'like', "%$search%")
					->orWhere('slug', 'like', "%$search%");
			});
		}
		if ($categorySlug = $request->get('category')) {
			$query->whereHas('category', function ($q) use ($categorySlug) {
				$q->where('slug', $categorySlug);
			});
		}
		$products = $query->latest()->paginate(12)->withQueryString();
		$categories = Category::where('is_active', true)->get();
		return view('products.index', compact('products', 'categories'));
	}

	public function show(string $slug)
	{
		$product = Product::with('images', 'category')->where('slug', $slug)->firstOrFail();
		$related = Product::where('category_id', $product->category_id)
			->where('id', '!=', $product->id)
			->take(4)->get();
		return view('products.show', compact('product', 'related'));
	}
}
