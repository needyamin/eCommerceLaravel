@extends('layouts.app')

@section('title', 'Products')

@section('content')
<div class="container py-5">
    @if(request('select') == '1')
    <style>
      header, nav.navbar, footer, .site-header, .site-footer { display:none !important; }
      body { padding-top: 0 !important; }
    </style>
    @endif
    <!-- Page Header -->
    @if(request('select') != '1')
    <div class="row mb-4 align-items-end">
        <div class="col-lg-8 col-12">
            <h1 class="display-5 fw-bold mb-2">Our Products</h1>
            <p class="lead text-muted">Discover our amazing collection of products</p>
        </div>
        <div class="col-lg-4 col-12">
            <div class="d-flex justify-content-lg-end justify-content-start gap-2">
                <div class="dropdown">
                    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        <i class="bi bi-sort-down me-2"></i>Sort
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
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
    @endif

    @if(request('select') == '1')
    <div class="alert alert-info d-flex justify-content-between align-items-center">
        <div>
            <i class="bi bi-hand-index-thumb me-2"></i>
            Select products to add to the POS. Use filters and pagination freely. Click "Done" when finished.
        </div>
        <div>
            <button class="btn btn-sm btn-outline-secondary" id="posSelectDoneBtn"><i class="bi bi-check2"></i> Done</button>
        </div>
    </div>
    @endif

    <div class="row">
        <!-- Sidebar Filters -->
        <aside class="col-lg-3 mb-4">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0">
                    <h5 class="mb-0"><i class="bi bi-funnel me-2"></i>Filters</h5>
                </div>
                <div class="card-body">
                    <form method="GET" action="{{ route('products.index') }}" class="d-grid gap-3">
                        @if(request('select') == '1')
                        <input type="hidden" name="select" value="1">
                        @endif
                        <div>
                            <label class="form-label fw-semibold">Search</label>
                            <input type="text" name="q" value="{{ request('q') }}" class="form-control" placeholder="Search products..." />
                        </div>

                        <div>
                            <label class="form-label fw-semibold">Category</label>
                            <div class="list-group list-group-flush">
                                <a class="list-group-item list-group-item-action {{ request('category') ? '' : 'active' }}" href="{{ route('products.index', array_merge(request()->except('category'), ['category' => null])) }}">All</a>
                                @foreach($categories as $cat)
                                    <a class="list-group-item list-group-item-action {{ request('category') === $cat->slug ? 'active' : '' }}" href="{{ route('products.index', array_merge(request()->except('page'), ['category' => $cat->slug])) }}">{{ $cat->name }}</a>
                                @endforeach
                            </div>
                        </div>

                        <div>
                            <label class="form-label fw-semibold">Price</label>
                            <div class="row g-2">
                                <div class="col-6">
                                    <input type="number" step="0.01" min="0" name="min_price" value="{{ request('min_price') }}" class="form-control" placeholder="Min" />
                                </div>
                                <div class="col-6">
                                    <input type="number" step="0.01" min="0" name="max_price" value="{{ request('max_price') }}" class="form-control" placeholder="Max" />
                                </div>
                            </div>
                        </div>

                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="featuredCheck" name="featured" {{ request('featured') == '1' ? 'checked' : '' }}>
                            <label class="form-check-label" for="featuredCheck">Featured only</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="stockCheck" name="in_stock" {{ request('in_stock') == '1' ? 'checked' : '' }}>
                            <label class="form-check-label" for="stockCheck">In stock only</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="saleCheck" name="on_sale" {{ request('on_sale') == '1' ? 'checked' : '' }}>
                            <label class="form-check-label" for="saleCheck">On sale</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="imageCheck" name="has_image" {{ request('has_image') == '1' ? 'checked' : '' }}>
                            <label class="form-check-label" for="imageCheck">With images</label>
                        </div>

                        <div>
                            <label class="form-label fw-semibold">Sort by</label>
                            <select class="form-select" name="sort">
                                <option value="newest" {{ request('sort') == 'newest' || !request()->has('sort') ? 'selected' : '' }}>Newest first</option>
                                <option value="oldest" {{ request('sort') == 'oldest' ? 'selected' : '' }}>Oldest first</option>
                                <option value="name" {{ request('sort') == 'name' ? 'selected' : '' }}>Name A-Z</option>
                                <option value="name_desc" {{ request('sort') == 'name_desc' ? 'selected' : '' }}>Name Z-A</option>
                                <option value="price_asc" {{ request('sort') == 'price_asc' ? 'selected' : '' }}>Price low to high</option>
                                <option value="price_desc" {{ request('sort') == 'price_desc' ? 'selected' : '' }}>Price high to low</option>
                            </select>
                        </div>

                        <div class="d-grid gap-2">
                            <div class="input-group">
                                <label class="input-group-text" for="perPage">Per page</label>
                                <select name="per_page" id="perPage" class="form-select">
                                    @foreach([12, 24, 36, 48] as $pp)
                                        <option value="{{ $pp }}" {{ (int)request('per_page', 12) === $pp ? 'selected' : '' }}>{{ $pp }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary"><i class="bi bi-funnel me-1"></i>Apply filters</button>
                            <a href="{{ request('select') == '1' ? route('products.index', ['select' => 1]) : route('products.index') }}" class="btn btn-outline-secondary"><i class="bi bi-x-circle me-1"></i>Clear all</a>
                        </div>
                    </form>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <div class="col-lg-9">
            <!-- Active Filters -->
            @if(request()->hasAny(['featured', 'in_stock', 'sort', 'q', 'category', 'min_price', 'max_price']))
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="card border-0 bg-light">
                            <div class="card-body py-2">
                                <div class="d-flex align-items-center flex-wrap gap-2">
                                    <span class="text-muted me-2">Active filters:</span>
                                    @if(request('q'))
                                        <span class="badge bg-primary">Search: "{{ request('q') }}"</span>
                                    @endif
                                    @if(request('category'))
                                        <span class="badge bg-secondary">Category: {{ request('category') }}</span>
                                    @endif
                                    @if(request('min_price') || request('max_price'))
                                        <span class="badge bg-info">Price: {{ request('min_price') ?: '0' }} - {{ request('max_price') ?: '∞' }}</span>
                                    @endif
                                    @if(request('featured') == '1')
                                        <span class="badge bg-warning text-dark">Featured</span>
                                    @endif
                                    @if(request('in_stock') == '1')
                                        <span class="badge bg-success">In stock</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Search Results Info -->
            @if(request('q'))
                <div class="row mb-3">
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
                        <div class="col-lg-4 col-md-6">
                            @include('products._card', ['product' => $product])
                        </div>
                    @endforeach
                </div>

                <!-- Infinite Scroll Sentinel -->
                <div id="infinite-scroll-sentinel" class="text-center text-muted py-4"></div>
                <div id="pagination-data" data-next-url="{{ $products->nextPageUrl() ?? '' }}" hidden></div>

                <!-- Visible Pagination Numbers -->
                <div class="row mt-4">
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
    </div>

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
@if(request('select') == '1')
<script>
document.addEventListener('click', function(e){
  const btn = e.target.closest('[data-select-product-id]');
  if(!btn) return;
  e.preventDefault();
  const pid = btn.getAttribute('data-select-product-id');
  const name = btn.getAttribute('data-product-name') || '';
  const sku = btn.getAttribute('data-product-sku') || '';
  const price = parseFloat(btn.getAttribute('data-product-price')||'0');
  let qty = 1;
  const card = btn.closest('.card');
  if(card){
    const qEl = card.querySelector('[data-select-qty]');
    if(qEl){ qty = Math.max(1, parseInt(qEl.value||'1',10)); }
  }
  try {
    if(window.opener){
      window.opener.postMessage({ type: 'POS_SELECT_PRODUCT', product_id: pid, name, sku, price, quantity: qty }, '*');
    }
    // Visual feedback
    btn.classList.remove('btn-outline-primary');
    btn.classList.add('btn-success');
    btn.innerHTML = '<i class="bi bi-check2"></i> Added';
    setTimeout(()=>{
      btn.classList.remove('btn-success');
      btn.classList.add('btn-outline-primary');
      btn.innerHTML = '<i class="bi bi-check2-circle me-1"></i> Select This Product';
    }, 800);
  } catch(_) {}
});
document.getElementById('posSelectDoneBtn')?.addEventListener('click', function(){ try{ window.close(); }catch(_){} });
</script>
@endif
@endpush

