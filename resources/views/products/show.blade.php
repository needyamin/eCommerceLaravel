@extends('layouts.app')

@section('title', $product->name)

@section('content')
<div class="container py-5">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ route('products.index') }}">Products</a></li>
            @if($product->category)
                <li class="breadcrumb-item"><a href="{{ route('categories.show', $product->category->slug) }}">{{ $product->category->name }}</a></li>
            @endif
            <li class="breadcrumb-item active" aria-current="page">{{ $product->name }}</li>
        </ol>
    </nav>

    <div class="row">
        <!-- Product Images -->
        <div class="col-lg-6 mb-4">
            <div class="card border-0 shadow-sm">
                <div class="card-body p-0">
                    @if($product->images->count() > 0)
                        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                @foreach($product->images as $index => $image)
                                    <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                                        <img src="{{ asset('storage/' . $image->image_path) }}" 
                                             class="d-block w-100" 
                                             alt="{{ $product->name }}"
                                             style="height: 400px; object-fit: cover;">
                                    </div>
                                @endforeach
                            </div>
                            @if($product->images->count() > 1)
                                <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon"></span>
                                </button>
                            @endif
                        </div>
                    @else
                        <div class="d-flex align-items-center justify-content-center bg-light" style="height: 400px;">
                            <i class="bi bi-image text-muted display-1"></i>
                        </div>
                    @endif
                </div>
            </div>
        </div>

        <!-- Product Details -->
        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <div class="mb-3">
                        @if($product->is_featured)
                            <span class="badge bg-warning text-dark mb-2">
                                <i class="bi bi-star-fill me-1"></i>Featured Product
                            </span>
                        @endif
                        @if($product->compare_at_price && $product->compare_at_price > $product->price)
                            @php
                                $discount = round((($product->compare_at_price - $product->price) / $product->compare_at_price) * 100);
                            @endphp
                            <span class="badge bg-danger mb-2">-{{ $discount }}% OFF</span>
                        @endif
                    </div>

                    <h1 class="display-6 fw-bold mb-3">{{ $product->name }}</h1>
                    
                    @if($product->sku)
                        <p class="text-muted mb-3">
                            <strong>SKU:</strong> {{ $product->sku }}
                        </p>
                    @endif

                    <div class="mb-4">
                            <div class="d-flex align-items-center mb-2">
                                <span class="h2 text-primary mb-0 me-3">@currency($product->price)</span>
                                @if($product->compare_at_price && $product->compare_at_price > $product->price)
                                    <span class="text-muted text-decoration-line-through fs-5">
                                        @currency($product->compare_at_price)
                                    </span>
                                @endif
                            </div>
                        @if($product->stock > 0)
                            <span class="badge bg-success fs-6">
                                <i class="bi bi-check-circle me-1"></i>In Stock ({{ $product->stock }} available)
                            </span>
                        @else
                            <span class="badge bg-danger fs-6">
                                <i class="bi bi-x-circle me-1"></i>Out of Stock
                            </span>
                        @endif
                    </div>

                    @if($product->short_description)
                        <div class="mb-4">
                            <h5>Quick Overview</h5>
                            <p class="text-muted">{{ $product->short_description }}</p>
                        </div>
                    @endif

                    <form action="{{ route('cart.add') }}" method="post" class="mb-4">
                        @csrf
                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                        
                        <div class="row align-items-end">
                            <div class="col-md-4 mb-3">
                                <label for="quantity" class="form-label fw-semibold">Quantity</label>
                                <input type="number" min="1" max="{{ $product->stock }}" 
                                       name="quantity" value="1" 
                                       class="form-control form-control-lg" 
                                       id="quantity" required>
                            </div>
                            <div class="col-md-8 mb-3">
                                <button type="submit" class="btn btn-primary btn-lg w-100 btn-custom"
                                        {{ $product->stock <= 0 ? 'disabled' : '' }}>
                                    <i class="bi bi-cart-plus me-2"></i>
                                    {{ $product->stock <= 0 ? 'Out of Stock' : 'Add to Cart' }}
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Product Features -->
                    <div class="row text-center mb-4">
                        <div class="col-4">
                            <i class="bi bi-truck text-primary fs-3 mb-2 d-block"></i>
                            <small class="text-muted">Free Shipping</small>
                        </div>
                        <div class="col-4">
                            <i class="bi bi-shield-check text-primary fs-3 mb-2 d-block"></i>
                            <small class="text-muted">Secure Payment</small>
                        </div>
                        <div class="col-4">
                            <i class="bi bi-arrow-clockwise text-primary fs-3 mb-2 d-block"></i>
                            <small class="text-muted">Easy Returns</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Product Description -->
    @if($product->description)
        <div class="row mt-5">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">
                            <i class="bi bi-info-circle me-2"></i>Product Description
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="prose">{!! nl2br(e($product->description)) !!}</div>
                    </div>
                </div>
            </div>
        </div>
    @endif

    <!-- Related Products -->
    @if($related->count() > 0)
        <div class="row mt-5">
            <div class="col-12">
                <h3 class="fw-bold mb-4">
                    <i class="bi bi-grid me-2"></i>Related Products
                </h3>
                <div class="row g-4">
                    @foreach($related as $relatedProduct)
                        <div class="col-lg-3 col-md-6">
                            @include('products._card', ['product' => $relatedProduct])
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    @endif
</div>
@endsection


