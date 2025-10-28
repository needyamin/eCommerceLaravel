@extends('layouts.app')

@section('title', 'Home')

@section('content')
<!-- Hero Section -->
<section class="hero-section py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4">Welcome to eCommerce Store</h1>
                <p class="lead mb-4">
                    Discover amazing products at unbeatable prices. 
                    Shop with confidence and enjoy fast, reliable delivery.
                </p>
                <div class="d-flex gap-3">
                    <a href="{{ route('products.index') }}" class="btn btn-light btn-lg btn-custom">
                        <i class="bi bi-grid me-2"></i>Shop Now
                    </a>
                    <a href="#featured" class="btn btn-outline-light btn-lg btn-custom">
                        <i class="bi bi-star me-2"></i>Featured Products
                    </a>
                </div>
            </div>
            <div class="col-lg-6 text-center">
                <i class="bi bi-shop display-1 opacity-75"></i>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <i class="bi bi-truck text-primary fs-1 mb-3"></i>
                        <h5 class="card-title">Free Shipping</h5>
                        <p class="card-text">Free shipping on orders over $50. Fast and reliable delivery to your doorstep.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <i class="bi bi-shield-check text-primary fs-1 mb-3"></i>
                        <h5 class="card-title">Secure Payment</h5>
                        <p class="card-text">Your payment information is secure with our encrypted checkout process.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <i class="bi bi-headset text-primary fs-1 mb-3"></i>
                        <h5 class="card-title">24/7 Support</h5>
                        <p class="card-text">Our customer support team is here to help you 24 hours a day, 7 days a week.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Top Categories -->
<section class="py-5">
    <div class="container">
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h2 class="display-6 fw-bold mb-2"><i class="bi bi-collection me-2 text-primary"></i>Top Categories</h2>
                <p class="text-muted mb-0">Browse what shoppers are exploring right now</p>
            </div>
        </div>
        <div class="row g-3 g-md-4 justify-content-center">
            @foreach($categories as $cat)
                <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                    <a href="{{ route('categories.show', $cat->slug) }}" class="cat-item d-block text-center text-decoration-none p-3 h-100 border rounded-3 bg-white">
                        @php $img = $cat->image ? asset('storage/' . $cat->image) : asset('admin-assets/assets/img/AdminLTELogo.png'); @endphp
                        <div class="mx-auto mb-2 cat-avatar">
                            <img src="{{ $img }}" alt="{{ $cat->name }}" class="rounded-circle" width="88" height="88" style="object-fit: cover;" />
                        </div>
                        <div class="small fw-semibold text-body text-truncate">{{ $cat->name }}</div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
    <style>
        .cat-item{ transition: all .15s ease-in-out; }
        .cat-item:hover{ transform: translateY(-2px); box-shadow: 0 .25rem .75rem rgba(0,0,0,.06); border-color: rgba(13,110,253,.35)!important; }
        .cat-avatar{ width: 96px; height: 96px; border-radius: 50%; padding: 4px; background: linear-gradient(135deg, rgba(13,110,253,.25), rgba(13,110,253,.05)); display: flex; align-items: center; justify-content: center; }
        @media (min-width: 992px){ .cat-item{ background-color:#fff; } }
    </style>
</section>

<!-- Featured Products -->
<section id="featured" class="py-5">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="display-5 fw-bold mb-3">Featured Products</h2>
                <p class="lead text-muted">Handpicked products just for you</p>
            </div>
        </div>
        <div class="row g-4">
            @foreach($featuredProducts as $product)
                <div class="col-lg-3 col-md-6">
                    @include('products._card', ['product' => $product])
                </div>
            @endforeach
        </div>
        <div class="text-center mt-5">
            <a href="{{ route('products.index') }}" class="btn btn-primary btn-lg btn-custom">
                <i class="bi bi-grid me-2"></i>View All Products
            </a>
        </div>
    </div>
</section>

<!-- Latest Products -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row mb-5">
            <div class="col-12 text-center">
                <h2 class="display-5 fw-bold mb-3">Latest Products</h2>
                <p class="lead text-muted">Fresh arrivals in our store</p>
            </div>
        </div>
        <div class="row g-4">
            @foreach($latestProducts as $product)
                <div class="col-lg-3 col-md-6">
                    @include('products._card', ['product' => $product])
                </div>
            @endforeach
        </div>
    </div>
</section>

<!-- Newsletter Section -->
    <section class="py-5 bg-primary text-white">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h3 class="fw-bold mb-2">Stay Updated</h3>
                <p class="mb-0">Subscribe to our newsletter and never miss out on great deals!</p>
            </div>
            <div class="col-lg-6">
                    <form class="d-flex" action="{{ route('newsletter.subscribe') }}" method="post">
                        @csrf
                        <input type="hidden" name="source" value="home">
                        <input type="email" name="email" class="form-control me-2" placeholder="Enter your email" required>
                        <button class="btn btn-light btn-custom" type="submit">
                            <i class="bi bi-send me-1"></i>Subscribe
                        </button>
                    </form>
            </div>
        </div>
    </div>
</section>
@endsection


