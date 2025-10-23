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
		
		// Search functionality
		if ($search = $request->get('q')) {
			$query->where(function ($q) use ($search) {
				$q->where('name', 'like', "%$search%")
					->orWhere('slug', 'like', "%$search%")
					->orWhere('short_description', 'like', "%$search%")
					->orWhere('description', 'like', "%$search%");
			});
		}
		
		// Category filter
		if ($categorySlug = $request->get('category')) {
			$query->whereHas('category', function ($q) use ($categorySlug) {
				$q->where('slug', $categorySlug);
			});
		}
		
		// Featured filter
		if ($request->has('featured') && $request->get('featured') == '1') {
			$query->where('is_featured', true);
		}
		
		// In stock filter
		if ($request->has('in_stock') && $request->get('in_stock') == '1') {
			$query->where('stock', '>', 0);
		}
		
		// Price range filter
		if ($minPrice = $request->get('min_price')) {
			$query->where('price', '>=', $minPrice);
		}
		if ($maxPrice = $request->get('max_price')) {
			$query->where('price', '<=', $maxPrice);
		}
		
		// Sorting
		$sort = $request->get('sort', 'newest');
		switch ($sort) {
			case 'name':
				$query->orderBy('name', 'asc');
				break;
			case 'name_desc':
				$query->orderBy('name', 'desc');
				break;
			case 'price_asc':
				$query->orderBy('price', 'asc');
				break;
			case 'price_desc':
				$query->orderBy('price', 'desc');
				break;
			case 'oldest':
				$query->oldest();
				break;
			case 'newest':
			default:
				$query->latest();
				break;
		}
		
		$products = $query->paginate(12)->withQueryString();
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
