<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;

class CategoryController extends Controller
{
	public function show(string $slug)
	{
		$category = Category::where('slug', $slug)->firstOrFail();
		$products = Product::where('category_id', $category->id)
			->where('is_active', true)
			->latest()
			->paginate(12);
		return view('categories.show', compact('category', 'products'));
	}
}
