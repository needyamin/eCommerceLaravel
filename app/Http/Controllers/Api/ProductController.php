<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Support\CurrencyManager;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $query = Product::with(['images', 'category'])->where('is_active', true);
        if ($request->filled('q')) {
            $q = $request->string('q');
            $query->where(function ($qbuilder) use ($q) {
                $qbuilder->where('name', 'like', "%{$q}%")
                    ->orWhere('sku', 'like', "%{$q}%");
            });
        }
        if ($request->filled('category_id')) {
            $query->where('category_id', $request->integer('category_id'));
        }
        $perPage = (int) $request->input('per_page', 20);
        if ($perPage < 1) { $perPage = 20; }
        if ($perPage > 100) { $perPage = 100; }
        $products = $query->latest()->paginate($perPage);

        $data = $products->getCollection()->map(fn ($p) => $this->productResource($p));
        return response()->json([
            'data' => $data,
            'meta' => [
                'current_page' => $products->currentPage(),
                'last_page' => $products->lastPage(),
                'per_page' => $products->perPage(),
                'total' => $products->total(),
            ],
        ]);
    }

    public function show(string $slug)
    {
        $product = Product::with(['images', 'category'])->where('slug', $slug)->where('is_active', true)->firstOrFail();
        return response()->json($this->productResource($product, true));
    }

    private function productResource(Product $p, bool $detailed = false): array
    {
        $current = CurrencyManager::current();
        $price = (float) $p->price;
        $compare = $p->compare_at_price ? (float) $p->compare_at_price : null;
        return [
            'id' => $p->id,
            'name' => $p->name,
            'slug' => $p->slug,
            'sku' => $p->sku,
            'short_description' => $p->short_description,
            'description' => $detailed ? $p->description : null,
            'stock' => (int) $p->stock,
            'category' => $p->category ? [
                'id' => $p->category->id,
                'name' => $p->category->name,
                'slug' => $p->category->slug,
            ] : null,
            'images' => $p->images->map(fn ($img) => [
                'id' => $img->id,
                'path' => $img->path,
                'is_primary' => (bool) $img->is_primary,
            ]),
            'price' => [
                'amount' => $price,
                'formatted' => CurrencyManager::format($price, $current),
            ],
            'compare_at_price' => $compare !== null ? [
                'amount' => $compare,
                'formatted' => CurrencyManager::format($compare, $current),
            ] : null,
            'currency' => [
                'code' => $current->code,
                'symbol' => $current->symbol,
            ],
        ];
    }
}


