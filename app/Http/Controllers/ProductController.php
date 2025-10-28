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
		
		// Price range filter (robust parsing and min/max swap)
		$minPrice = $request->filled('min_price') ? (float) $request->get('min_price') : null;
		$maxPrice = $request->filled('max_price') ? (float) $request->get('max_price') : null;
		if (!is_null($minPrice) && !is_null($maxPrice) && $minPrice > $maxPrice) {
			[$minPrice, $maxPrice] = [$maxPrice, $minPrice];
		}
		if (!is_null($minPrice)) {
			$query->where('price', '>=', $minPrice);
		}
		if (!is_null($maxPrice)) {
			$query->where('price', '<=', $maxPrice);
		}

		// On sale filter
		if ($request->has('on_sale') && $request->get('on_sale') == '1') {
			$query->whereNotNull('compare_at_price')->whereColumn('price', '<', 'compare_at_price');
		}

		// Has image filter
		if ($request->has('has_image') && $request->get('has_image') == '1') {
			$query->whereHas('images');
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
		
		$perPage = (int) $request->get('per_page', 12);
		$perPage = max(6, min(60, $perPage));
		$products = $query->paginate($perPage)->withQueryString();
		$categories = Category::where('is_active', true)->orderBy('name')->get();
		
		return view('products.index', compact('products', 'categories'));
	}

	public function show(string $slug)
	{
		$product = Product::with('images', 'category')->where('slug', $slug)->firstOrFail();
		$related = Product::where('category_id', $product->category_id)
			->where('id', '!=', $product->id)
			->latest()
			->take(10)
			->get();
		return view('products.show', compact('product', 'related'));
	}
}
