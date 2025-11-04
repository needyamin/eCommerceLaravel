<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('category')->latest()->paginate(20);
        return view('admin.products.index', compact('products'));
    }

    public function create()
    {
        $categories = Category::pluck('name', 'id');
        return view('admin.products.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'required|string|max:255|unique:products,slug',
            'sku' => 'nullable|string|max:255|unique:products,sku',
            'category_id' => 'nullable|exists:categories,id',
            'short_description' => 'nullable|string',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'compare_at_price' => 'nullable|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'is_active' => 'nullable|boolean',
            'is_featured' => 'nullable|boolean',
        ]);
        $validated['is_active'] = $request->boolean('is_active');
        $validated['is_featured'] = $request->boolean('is_featured');
        $product = Product::create($validated);
        return redirect()->route('admin.products.edit', $product)->with('success', 'Product created');
    }

    public function edit(Product $product)
    {
        $categories = Category::pluck('name', 'id');
        return view('admin.products.edit', compact('product', 'categories'));
    }

    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'required|string|max:255|unique:products,slug,' . $product->id,
            'sku' => 'nullable|string|max:255|unique:products,sku,' . $product->id,
            'category_id' => 'nullable|exists:categories,id',
            'short_description' => 'nullable|string',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'compare_at_price' => 'nullable|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'is_active' => 'nullable|boolean',
            'is_featured' => 'nullable|boolean',
        ]);
        $validated['is_active'] = $request->boolean('is_active');
        $validated['is_featured'] = $request->boolean('is_featured');
        $product->update($validated);
        return redirect()->route('admin.products.index')->with('success', 'Product updated');
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return redirect()->route('admin.products.index')->with('success', 'Product deleted');
    }

    public function lookup(Request $request)
    {
        $q = trim((string) $request->get('q', ''));
        $query = Product::query()->where('is_active', true);
        if ($q !== '') {
            $query->where(function($qq) use ($q){
                $qq->where('name','like',"%$q%")
                   ->orWhere('sku','like',"%$q%")
                   ->orWhere('id', $q);
            });
        }
        $products = $query->orderBy('name')->take(20)->get(['id','name','sku','price','stock']);
        return response()->json(['data' => $products]);
    }

    public function showJson(Product $product)
    {
        $base = number_format((float) $product->price, 2, '.', '');
        $display = number_format(\App\Support\CurrencyManager::convert((float) $product->price), 2, '.', '');
        return response()->json([
            'id' => $product->id,
            'name' => $product->name,
            'sku' => $product->sku,
            'base_price' => $base,
            'display_price' => $display,
            // keep price for backward compatibility (display currency)
            'price' => $display,
            'stock' => (int) $product->stock,
            'is_active' => (bool) $product->is_active,
        ]);
    }
}
