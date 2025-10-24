@extends('layouts.app')

@section('title', $category->name)

@section('content')
<div class="container py-5">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h2 fw-bold mb-1"><i class="bi bi-tags me-2 text-primary"></i>{{ $category->name }}</h1>
            @if(!empty($category->description))
                <p class="text-muted mb-0">{{ Str::limit($category->description, 160) }}</p>
            @endif
        </div>
        <a href="{{ route('products.index') }}" class="btn btn-outline-secondary"><i class="bi bi-grid me-1"></i>All Products</a>
    </div>

    <!-- Grid -->
    @if($products->count() > 0)
        <div class="row g-4">
        	@foreach($products as $product)
            	<div class="col-lg-3 col-md-6">
                	@include('products._card', ['product' => $product])
            	</div>
        	@endforeach
        </div>

        <!-- Pagination -->
        <div class="row mt-5">
            <div class="col-12 d-flex justify-content-center">
                {{ $products->links() }}
            </div>
        </div>
    @else
        <div class="alert alert-info"><i class="bi bi-info-circle me-2"></i>No products found in this category.</div>
    @endif
</div>
@endsection


