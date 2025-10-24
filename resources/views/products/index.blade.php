@extends('layouts.app')

@section('title', 'Products')

@section('content')
<div class="container py-5">
    <!-- Page Header -->
    <div class="row mb-5">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="display-5 fw-bold mb-2">Our Products</h1>
                    <p class="lead text-muted">Discover our amazing collection of products</p>
                </div>
                <div class="d-flex gap-2">
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            <i class="bi bi-funnel me-2"></i>Filter
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item {{ !request()->has('featured') && !request()->has('in_stock') ? 'active' : '' }}" 
                                   href="{{ route('products.index', request()->except(['featured', 'in_stock'])) }}">All Products</a></li>
                            <li><a class="dropdown-item {{ request('featured') == '1' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['featured' => '1']) }}">Featured Only</a></li>
                            <li><a class="dropdown-item {{ request('in_stock') == '1' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['in_stock' => '1']) }}">In Stock Only</a></li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                            <i class="bi bi-sort-down me-2"></i>Sort
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item {{ request('sort') == 'newest' || !request()->has('sort') ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['sort' => 'newest']) }}">Newest First</a></li>
                            <li><a class="dropdown-item {{ request('sort') == 'oldest' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['sort' => 'oldest']) }}">Oldest First</a></li>
                            <li><a class="dropdown-item {{ request('sort') == 'name' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['sort' => 'name']) }}">Name A-Z</a></li>
                            <li><a class="dropdown-item {{ request('sort') == 'name_desc' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['sort' => 'name_desc']) }}">Name Z-A</a></li>
                            <li><a class="dropdown-item {{ request('sort') == 'price_asc' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['sort' => 'price_asc']) }}">Price Low to High</a></li>
                            <li><a class="dropdown-item {{ request('sort') == 'price_desc' ? 'active' : '' }}" 
                                   href="{{ request()->fullUrlWithQuery(['sort' => 'price_desc']) }}">Price High to Low</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Active Filters -->
    @if(request()->hasAny(['featured', 'in_stock', 'sort', 'q', 'category']))
        <div class="row mb-4">
            <div class="col-12">
                <div class="card border-0 bg-light">
                    <div class="card-body py-2">
                        <div class="d-flex align-items-center flex-wrap gap-2">
                            <span class="text-muted me-2">Active filters:</span>
                            
                            @if(request('q'))
                                <span class="badge bg-primary">
                                    Search: "{{ request('q') }}"
                                    <a href="{{ request()->fullUrlWithQuery(['q' => null]) }}" class="text-white ms-1">
                                        <i class="bi bi-x"></i>
                                    </a>
                                </span>
                            @endif
                            
                            @if(request('featured') == '1')
                                <span class="badge bg-warning text-dark">
                                    Featured Only
                                    <a href="{{ request()->fullUrlWithQuery(['featured' => null]) }}" class="text-dark ms-1">
                                        <i class="bi bi-x"></i>
                                    </a>
                                </span>
                            @endif
                            
                            @if(request('in_stock') == '1')
                                <span class="badge bg-success">
                                    In Stock Only
                                    <a href="{{ request()->fullUrlWithQuery(['in_stock' => null]) }}" class="text-white ms-1">
                                        <i class="bi bi-x"></i>
                                    </a>
                                </span>
                            @endif
                            
                            @if(request('sort') && request('sort') != 'newest')
                                <span class="badge bg-info">
                                    Sort: {{ ucfirst(str_replace('_', ' ', request('sort'))) }}
                                    <a href="{{ request()->fullUrlWithQuery(['sort' => null]) }}" class="text-white ms-1">
                                        <i class="bi bi-x"></i>
                                    </a>
                                </span>
                            @endif
                            
                            @if(request('category'))
                                <span class="badge bg-secondary">
                                    Category: {{ request('category') }}
                                    <a href="{{ request()->fullUrlWithQuery(['category' => null]) }}" class="text-white ms-1">
                                        <i class="bi bi-x"></i>
                                    </a>
                                </span>
                            @endif
                            
                            <a href="{{ route('products.index') }}" class="btn btn-outline-secondary btn-sm">
                                <i class="bi bi-x-circle me-1"></i>Clear All
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif

    <!-- Search Results Info -->
    @if(request('q'))
        <div class="row mb-4">
            <div class="col-12">
                <div class="alert alert-info">
                    <i class="bi bi-search me-2"></i>
                    Showing results for "<strong>{{ request('q') }}</strong>" 
                    ({{ $products->total() }} {{ Str::plural('result', $products->total()) }})
                </div>
            </div>
        </div>
    @endif

    <!-- Products Grid -->
    @if($products->count() > 0)
        <div id="productGrid" class="row g-4">
            @foreach($products as $product)
                <div class="col-lg-3 col-md-6">
                    @include('products._card', ['product' => $product])
                </div>
            @endforeach
        </div>

        <!-- Infinite Scroll Sentinel -->
        <div id="infinite-scroll-sentinel" class="text-center text-muted py-4"></div>
        <div id="pagination-data" data-next-url="{{ $products->nextPageUrl() ?? '' }}" hidden></div>

        <!-- Visible Pagination Numbers -->
        <div class="row mt-5">
            <div class="col-12">
                <nav id="pagination-container" aria-label="Products pagination">
                    {{ $products->links() }}
                </nav>
            </div>
        </div>
    @else
        <!-- No Products Found -->
        <div class="row">
            <div class="col-12 text-center py-5">
                <i class="bi bi-search display-1 text-muted mb-4"></i>
                <h3 class="text-muted mb-3">No Products Found</h3>
                <p class="text-muted mb-4">
                    @if(request('q'))
                        We couldn't find any products matching "{{ request('q') }}". 
                        Try searching with different keywords.
                    @else
                        There are no products available at the moment.
                    @endif
                </p>
                <a href="{{ route('products.index') }}" class="btn btn-primary btn-custom">
                    <i class="bi bi-arrow-left me-2"></i>Back to All Products
                </a>
            </div>
        </div>
    @endif
</div>
@endsection


@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
    const grid = document.getElementById('productGrid');
    const sentinel = document.getElementById('infinite-scroll-sentinel');
    const dataEl = document.getElementById('pagination-data');
    if(!grid || !sentinel || !dataEl) return;

    let nextUrl = dataEl.dataset.nextUrl;
    let loading = false;

    const loadMore = async () => {
        if (!nextUrl || loading) return;
        loading = true;
        sentinel.innerHTML = '<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>';
        try {
            const res = await fetch(nextUrl, { headers: { 'X-Requested-With': 'XMLHttpRequest', 'Accept': 'text/html' } });
            const html = await res.text();
            const doc = new DOMParser().parseFromString(html, 'text/html');
            const newGrid = doc.getElementById('productGrid');
            const newCards = newGrid ? Array.from(newGrid.children) : [];
            newCards.forEach(node => grid.appendChild(node));
            const newDataEl = doc.getElementById('pagination-data');
            nextUrl = newDataEl ? newDataEl.dataset.nextUrl : '';

            // Update pagination numbers to reflect current page
            const newPagination = doc.getElementById('pagination-container');
            const paginationContainer = document.getElementById('pagination-container');
            if (newPagination && paginationContainer) {
                paginationContainer.innerHTML = newPagination.innerHTML;
            }
            if (!nextUrl) {
                sentinel.innerHTML = '<span>No more products</span>';
                observer.disconnect();
            } else {
                sentinel.innerHTML = '';
            }
        } catch(e){
            sentinel.innerHTML = '';
        } finally {
            loading = false;
        }
    };

    const observer = new IntersectionObserver((entries) => {
        if (entries[0].isIntersecting) {
            loadMore();
        }
    }, { rootMargin: '400px 0px 0px 0px' });

    observer.observe(sentinel);
});
</script>
@endpush

