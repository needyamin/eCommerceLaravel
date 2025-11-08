@extends('layouts.app')

@section('title', $product->name)

@push('styles')
<style>
.rating-input {
    display: flex;
    flex-direction: row-reverse;
    justify-content: flex-end;
    gap: 5px;
}
.rating-input input[type="radio"] {
    display: none;
}
.rating-input label {
    cursor: pointer;
    color: #ddd;
    font-size: 1.5rem;
    transition: color 0.2s;
}
.rating-input input[type="radio"]:checked ~ label,
.rating-input label:hover,
.rating-input label:hover ~ label {
    color: #ffc107;
}
.rating-input input[type="radio"]:checked ~ label {
    color: #ffc107;
}
</style>
@endpush

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
                        @if($product->images->count() > 1)
                            <div class="d-flex gap-2 flex-wrap mt-3" id="productThumbnails">
                                @foreach($product->images as $index => $image)
                                    <button type="button" class="btn p-0 border-0 thumb-btn {{ $index === 0 ? 'thumb-active' : '' }}" data-bs-target="#productCarousel" data-bs-slide-to="{{ $index }}" aria-label="Slide {{ $index + 1 }}">
                                        <img src="{{ asset('storage/' . $image->image_path) }}" alt="{{ $product->name }} thumbnail {{ $index + 1 }}" style="width: 80px; height: 60px; object-fit: cover;" class="rounded border">
                                    </button>
                                @endforeach
                            </div>
                        @endif
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

                    <div class="mb-4 d-flex align-items-center justify-content-between">
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
                            @php $settings = \App\Models\SiteSetting::get(); @endphp
                            @if($settings->wishlist_enabled ?? true)
                                <div class="ms-3">
                                    @php
                                        if (auth()->check()) {
                                            $isWishlisted = \App\Models\Wishlist::where('user_id', auth()->id())->where('product_id', $product->id)->exists();
                                        } else {
                                            $sid = session('wishlist_session_id');
                                            $isWishlisted = $sid ? \App\Models\GuestWishlist::where('session_id', $sid)->where('product_id', $product->id)->exists() : false;
                                        }
                                    @endphp
                                    <button class="btn {{ $isWishlisted ? 'btn-danger' : 'btn-outline-danger' }} wishlist-toggle" data-product-id="{{ $product->id }}">
                                        <i class="bi {{ $isWishlisted ? 'bi-heart-fill' : 'bi-heart' }} me-1"></i>
                                        <span>{{ $isWishlisted ? 'Wishlisted' : 'Add to Wishlist' }}</span>
                                    </button>
                                </div>
                            @endif
                    </div>

                    @if($product->short_description)
                        <div class="mb-4">
                            <h5>Quick Overview</h5>
                            <p class="text-muted">{{ $product->short_description }}</p>
                        </div>
                    @endif

                        @php
                            $cartItem = null;
                            if (auth()->check()) {
                                $cart = \App\Models\Cart::where('user_id', auth()->id())->with('items')->first();
                                if ($cart) { $cartItem = $cart->items->firstWhere('product_id', $product->id); }
                            } else {
                                $sessionId = session('cart_session_id');
                                if ($sessionId) {
                                    $cart = \App\Models\Cart::where('session_id', $sessionId)->with('items')->first();
                                    if ($cart) { $cartItem = $cart->items->firstWhere('product_id', $product->id); }
                                }
                            }
                        @endphp

                        @if($cartItem)
                            <div class="alert alert-success d-flex justify-content-between align-items-center mb-3" data-stock="{{ (int) $product->stock }}" data-item-id="{{ $cartItem->id }}">
                                <div>
                                    <i class="bi bi-check-circle me-2"></i>Carted ({{ $cartItem->quantity }} {{ Str::plural('item', $cartItem->quantity) }})
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <form action="{{ route('cart.items.update', $cartItem->id) }}" method="post" class="d-inline" onsubmit="return pdUpdateCartItemAjax(event, this)">
                                        @csrf
                                        @method('PUT')
                                        <input type="hidden" name="quantity" value="{{ max(1, $cartItem->quantity - 1) }}">
                                        <button class="btn btn-sm btn-outline-secondary" {{ $cartItem->quantity <= 1 ? 'disabled' : '' }}>
                                            <i class="bi bi-dash"></i>
                                        </button>
                                    </form>
                                    <form action="{{ route('cart.items.update', $cartItem->id) }}" method="post" class="d-inline" onsubmit="return pdUpdateCartItemAjax(event, this)">
                                        @csrf
                                        @method('PUT')
                                        <input type="hidden" name="quantity" value="{{ min($product->stock, $cartItem->quantity + 1) }}">
                                        <button class="btn btn-sm btn-outline-secondary" {{ $product->stock <= $cartItem->quantity ? 'disabled' : '' }}>
                                            <i class="bi bi-plus"></i>
                                        </button>
                                    </form>
                                    <button class="btn btn-sm btn-outline-danger" title="Remove from cart" onclick="return pdRemoveCartItemAjax(event, {{ $cartItem->id }}, {{ (int) $product->id }}, {{ (int) $product->stock }});">
                                        <i class="bi bi-x"></i>
                                    </button>
                                </div>
                            </div>
                            <a href="{{ route('cart.index') }}" class="btn btn-outline-primary btn-custom mb-4 w-100">
                                <i class="bi bi-cart"></i> View Cart
                            </a>
                        @else
                            <form action="{{ route('cart.add') }}" method="post" class="mb-4" onsubmit="return pdAddToCartAjax(event, this)" data-stock="{{ (int) $product->stock }}">
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
                        @endif

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

    <!-- Reviews Section -->
    @if($settings->reviews_enabled ?? true)
        <div class="row mt-5">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">
                            <i class="bi bi-star me-2"></i>Reviews & Ratings
                            @if($product->total_reviews > 0)
                                <span class="badge bg-primary ms-2">{{ $product->total_reviews }} Review{{ $product->total_reviews > 1 ? 's' : '' }}</span>
                                <span class="ms-2">
                                    @for($i = 1; $i <= 5; $i++)
                                        <i class="bi bi-star{{ $i <= round($product->average_rating) ? '-fill text-warning' : '' }}"></i>
                                    @endfor
                                    <span class="ms-1">({{ number_format($product->average_rating, 1) }})</span>
                                </span>
                            @endif
                        </h5>
                    </div>
                    <div class="card-body">
                        <!-- Review Form -->
                        @if(auth()->check() && !$userHasReviewed && ($userCanReview || !($settings->reviews_require_purchase ?? false)))
                            <div class="mb-4 p-3 bg-light rounded">
                                <h6 class="mb-3">Write a Review</h6>
                                <form action="{{ route('reviews.store', $product) }}" method="POST">
                                    @csrf
                                    <div class="mb-3">
                                        <label class="form-label">Rating</label>
                                        <div class="rating-input">
                                            @for($i = 5; $i >= 1; $i--)
                                                <input type="radio" name="rating" value="{{ $i }}" id="rating{{ $i }}" required>
                                                <label for="rating{{ $i }}" class="star-label"><i class="bi bi-star-fill"></i></label>
                                            @endfor
                                        </div>
                                        @error('rating')<div class="text-danger small">{{ $message }}</div>@enderror
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Review Title (Optional)</label>
                                        <input type="text" name="title" class="form-control" value="{{ old('title') }}" maxlength="255">
                                        @error('title')<div class="text-danger small">{{ $message }}</div>@enderror
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Your Review</label>
                                        <textarea name="comment" class="form-control" rows="4" required minlength="10" maxlength="1000">{{ old('comment') }}</textarea>
                                        <small class="text-muted">Minimum 10 characters</small>
                                        @error('comment')<div class="text-danger small">{{ $message }}</div>@enderror
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit Review</button>
                                </form>
                            </div>
                        @elseif(auth()->check() && $userHasReviewed)
                            <div class="alert alert-info mb-4">
                                <i class="bi bi-info-circle me-2"></i>You have already reviewed this product.
                            </div>
                        @elseif(!auth()->check() && !($settings->reviews_allow_anonymous ?? false))
                            <div class="alert alert-warning mb-4">
                                <i class="bi bi-exclamation-triangle me-2"></i>Please <a href="{{ route('login') }}">login</a> to write a review.
                            </div>
                        @endif

                        <!-- Reviews List -->
                        @if($product->approvedReviews->count() > 0)
                            <div class="reviews-list">
                                <h6 class="mb-3">Customer Reviews</h6>
                                @foreach($product->approvedReviews->take(10) as $review)
                                    <div class="review-item border-bottom pb-3 mb-3">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <div>
                                                <strong>{{ $review->user->name ?? 'Anonymous' }}</strong>
                                                @if($review->is_verified_purchase)
                                                    <span class="badge bg-success ms-2"><i class="bi bi-check-circle me-1"></i>Verified Purchase</span>
                                                @endif
                                            </div>
                                            <div class="text-muted small">{{ $review->created_at->format('M d, Y') }}</div>
                                        </div>
                                        <div class="mb-2">
                                            @for($i = 1; $i <= 5; $i++)
                                                <i class="bi bi-star{{ $i <= $review->rating ? '-fill text-warning' : '' }}"></i>
                                            @endfor
                                        </div>
                                        @if($review->title)
                                            <h6 class="mb-2">{{ $review->title }}</h6>
                                        @endif
                                        <p class="mb-0">{{ $review->comment }}</p>
                                    </div>
                                @endforeach
                            </div>
                        @else
                            <p class="text-muted mb-0">No reviews yet. Be the first to review this product!</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    @endif

    <!-- Related Products -->
    @if($related->count() > 0)
        <div class="row mt-5">
            <div class="col-12">
                <h3 class="fw-bold mb-3">
                    <i class="bi bi-grid me-2"></i>Related Products
                </h3>
                <div class="position-relative">
                    <button type="button" class="btn btn-light border position-absolute top-50 start-0 translate-middle-y shadow-sm" id="relPrev" aria-label="Previous" style="z-index: 2;">
                        <i class="bi bi-chevron-left"></i>
                    </button>
                    <style>
                        /* Hide scrollbar but keep scroll functionality */
                        #relatedScroller{ -ms-overflow-style: none; scrollbar-width: none; }
                        #relatedScroller::-webkit-scrollbar{ display: none; }
                        #relatedScroller.dragging{ cursor: grabbing; }
                    </style>
                    <div class="overflow-x-auto" id="relatedScroller">
                        <div class="d-flex flex-nowrap gap-3 m-0 p-1" style="scroll-behavior: smooth;">
                            @foreach($related as $relatedProduct)
                                <div class="flex-shrink-0" style="width: 280px;">
                                    @include('products._card', ['product' => $relatedProduct])
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <button type="button" class="btn btn-light border position-absolute top-50 end-0 translate-middle-y shadow-sm" id="relNext" aria-label="Next" style="z-index: 2;">
                        <i class="bi bi-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    @endif
</div>
@endsection
<script>
document.addEventListener('DOMContentLoaded', function(){
    // Thumbnails sync with carousel
    const carousel = document.getElementById('productCarousel');
    if (carousel) {
        carousel.addEventListener('slid.bs.carousel', function (e) {
            const idx = e.to;
            document.querySelectorAll('#productThumbnails .thumb-btn').forEach((btn, i) => {
                const img = btn.querySelector('img');
                if (i === idx) {
                    btn.classList.add('thumb-active');
                    img && img.classList.add('border-primary');
                } else {
                    btn.classList.remove('thumb-active');
                    img && img.classList.remove('border-primary');
                }
            });
        });
    }

    // Related slider controls
    const scrollerWrap = document.getElementById('relatedScroller');
    if (scrollerWrap) {
        const scroller = scrollerWrap.firstElementChild;
        const prev = document.getElementById('relPrev');
        const next = document.getElementById('relNext');
        const step = Math.min(360, Math.max(280, scrollerWrap.clientWidth * 0.6));
        const updateButtons = () => {
            if (!scroller) return;
            if (prev) {
                prev.disabled = scrollerWrap.scrollLeft <= 0;
                prev.classList.toggle('d-none', prev.disabled);
            }
            const maxScroll = scroller.scrollWidth - scrollerWrap.clientWidth - 1;
            next && (next.disabled = scrollerWrap.scrollLeft >= maxScroll);
        };
        prev && prev.addEventListener('click', (e) => { e.preventDefault(); scrollerWrap.scrollBy({ left: -step, behavior: 'smooth' }); });
        next && next.addEventListener('click', (e) => { e.preventDefault(); scrollerWrap.scrollBy({ left: step, behavior: 'smooth' }); });
        scrollerWrap.addEventListener('scroll', updateButtons, { passive: true });
        window.addEventListener('resize', updateButtons);
        setTimeout(updateButtons, 100);

        // Drag-to-scroll (mouse + touch)
        let isDown = false;
        let startX = 0;
        let startScrollLeft = 0;
        const startDrag = (clientX) => {
            isDown = true;
            startX = clientX;
            startScrollLeft = scrollerWrap.scrollLeft;
            scrollerWrap.classList.add('dragging');
        };
        const onMove = (clientX) => {
            if (!isDown) return;
            const dx = clientX - startX;
            scrollerWrap.scrollLeft = startScrollLeft - dx;
        };
        const endDrag = () => {
            isDown = false;
            scrollerWrap.classList.remove('dragging');
        };
        // Mouse
        scrollerWrap.addEventListener('mousedown', (e) => { e.preventDefault(); startDrag(e.clientX); });
        window.addEventListener('mousemove', (e) => onMove(e.clientX));
        window.addEventListener('mouseup', endDrag);
        // Touch
        scrollerWrap.addEventListener('touchstart', (e) => { if (e.touches[0]) startDrag(e.touches[0].clientX); }, { passive: true });
        scrollerWrap.addEventListener('touchmove', (e) => { if (e.touches[0]) onMove(e.touches[0].clientX); }, { passive: true });
        scrollerWrap.addEventListener('touchend', endDrag);
    }
});
function pdAddToCartAjax(e, form){
    e.preventDefault();
    
    // Prevent multiple simultaneous requests
    const submitBtn = form.querySelector('button[type="submit"]');
    if (submitBtn && submitBtn.disabled) {
        return false;
    }
    
    // Disable button and show loading state
    if (submitBtn) {
        submitBtn.disabled = true;
        const originalText = submitBtn.innerHTML;
        submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span>Adding...';
        
        // Re-enable button on error
        const reEnableButton = () => {
            submitBtn.disabled = false;
            submitBtn.innerHTML = originalText;
        };
        
        const fd = new FormData(form);
        fetch(form.action, {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json',
                'X-CSRF-TOKEN': form.querySelector('input[name="_token"]').value
            },
            body: fd
        }).then(r=>{
            if (!r.ok) {
                return r.json().then(err => {
                    throw new Error(err.message || 'Network response was not ok');
                }).catch(() => {
                    throw new Error('Network response was not ok');
                });
            }
            return r.json();
        }).then(data=>{
            if(!data || !data.success) {
                reEnableButton();
                // Show error message if available
                if(data && data.message) {
                    alert(data.message);
                }
                return;
            }
            if(data.cart && typeof window.__updateCartCount === 'function'){
                window.__updateCartCount(data.cart.count);
            }
            const container = form.closest('.card');
            const wrap = document.createElement('div');
            wrap.className = 'alert alert-success d-flex justify-content-between align-items-center mb-3';
            wrap.setAttribute('data-stock', form.dataset.stock || '999999');
            wrap.setAttribute('data-item-id', data.item.id);
            wrap.innerHTML = `
                <div><i class="bi bi-check-circle me-2"></i>Carted (${data.item.quantity} ${data.item.quantity>1?'items':'item'})</div>
                <div class="d-flex align-items-center gap-2">
                    <form action="${window.location.origin}/cart/items/${data.item.id}" method="post" class="d-inline" onsubmit="return pdUpdateCartItemAjax(event, this)">
                        <input type="hidden" name="_token" value="${document.querySelector('meta[name=csrf-token]').getAttribute('content')}">
                        <input type="hidden" name="_method" value="PUT">
                        <input type="hidden" name="quantity" value="${Math.max(1, data.item.quantity - 1)}">
                        <button class="btn btn-sm btn-outline-secondary" ${data.item.quantity<=1?'disabled':''}><i class="bi bi-dash"></i></button>
                    </form>
                    <form action="${window.location.origin}/cart/items/${data.item.id}" method="post" class="d-inline" onsubmit="return pdUpdateCartItemAjax(event, this)">
                        <input type="hidden" name="_token" value="${document.querySelector('meta[name=csrf-token]').getAttribute('content')}">
                        <input type="hidden" name="_method" value="PUT">
                        <input type="hidden" name="quantity" value="${data.item.quantity + 1}">
                        <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-plus"></i></button>
                    </form>
                    <button class="btn btn-sm btn-outline-danger" title="Remove from cart" onclick="return pdRemoveCartItemAjax(event, ${data.item.id}, ${form.querySelector('input[name=product_id]').value}, ${parseInt(form.dataset.stock || '0', 10)});">
                        <i class="bi bi-x"></i>
                    </button>
                </div>`;
            form.parentNode.replaceChild(wrap, form);
            // Insert View Cart button right after the alert (ensure only one)
            try {
                const cardBody = wrap.closest('.card-body') || wrap.parentNode;
                cardBody && cardBody.querySelectorAll('.js-view-cart-btn').forEach(n=>n.remove());
                const viewBtn = document.createElement('a');
                viewBtn.href = "{{ route('cart.index') }}";
                viewBtn.className = 'btn btn-outline-primary btn-custom mb-4 w-100 js-view-cart-btn';
                viewBtn.innerHTML = '<i class="bi bi-cart"></i> View Cart';
                wrap.insertAdjacentElement('afterend', viewBtn);
            } catch(_) {}
        }).catch((error)=>{
            console.error('Add to cart error:', error);
            reEnableButton();
            // Show user-friendly error message
            alert(error.message || 'Failed to add item to cart. Please try again.');
        });
    } else {
        // Fallback if button not found
        const fd = new FormData(form);
        fetch(form.action, {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json',
                'X-CSRF-TOKEN': form.querySelector('input[name="_token"]').value
            },
            body: fd
        }).then(r=>r.json()).then(data=>{
            if(!data || !data.success) return;
            if(data.cart && typeof window.__updateCartCount === 'function'){
                window.__updateCartCount(data.cart.count);
            }
            const container = form.closest('.card');
            const wrap = document.createElement('div');
            wrap.className = 'alert alert-success d-flex justify-content-between align-items-center mb-3';
            wrap.setAttribute('data-stock', form.dataset.stock || '999999');
            wrap.setAttribute('data-item-id', data.item.id);
            wrap.innerHTML = `
                <div><i class="bi bi-check-circle me-2"></i>Carted (${data.item.quantity} ${data.item.quantity>1?'items':'item'})</div>
                <div class="d-flex align-items-center gap-2">
                    <form action="${window.location.origin}/cart/items/${data.item.id}" method="post" class="d-inline" onsubmit="return pdUpdateCartItemAjax(event, this)">
                        <input type="hidden" name="_token" value="${document.querySelector('meta[name=csrf-token]').getAttribute('content')}">
                        <input type="hidden" name="_method" value="PUT">
                        <input type="hidden" name="quantity" value="${Math.max(1, data.item.quantity - 1)}">
                        <button class="btn btn-sm btn-outline-secondary" ${data.item.quantity<=1?'disabled':''}><i class="bi bi-dash"></i></button>
                    </form>
                    <form action="${window.location.origin}/cart/items/${data.item.id}" method="post" class="d-inline" onsubmit="return pdUpdateCartItemAjax(event, this)">
                        <input type="hidden" name="_token" value="${document.querySelector('meta[name=csrf-token]').getAttribute('content')}">
                        <input type="hidden" name="_method" value="PUT">
                        <input type="hidden" name="quantity" value="${data.item.quantity + 1}">
                        <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-plus"></i></button>
                    </form>
                    <button class="btn btn-sm btn-outline-danger" title="Remove from cart" onclick="return pdRemoveCartItemAjax(event, ${data.item.id}, ${form.querySelector('input[name=product_id]').value}, ${parseInt(form.dataset.stock || '0', 10)});">
                        <i class="bi bi-x"></i>
                    </button>
                </div>`;
            form.parentNode.replaceChild(wrap, form);
            // Insert View Cart button right after the alert (ensure only one)
            try {
                const cardBody = wrap.closest('.card-body') || wrap.parentNode;
                cardBody && cardBody.querySelectorAll('.js-view-cart-btn').forEach(n=>n.remove());
                const viewBtn = document.createElement('a');
                viewBtn.href = "{{ route('cart.index') }}";
                viewBtn.className = 'btn btn-outline-primary btn-custom mb-4 w-100 js-view-cart-btn';
                viewBtn.innerHTML = '<i class="bi bi-cart"></i> View Cart';
                wrap.insertAdjacentElement('afterend', viewBtn);
            } catch(_) {}
        }).catch((error)=>{
            console.error('Add to cart error:', error);
        });
    }
    return false;
}

function pdUpdateCartItemAjax(e, form){
    e.preventDefault();
    const token = form.querySelector('input[name="_token"]').value;
    const qty = form.querySelector('input[name="quantity"]').value;
    fetch(form.action, {
        method: 'POST',
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': token
        },
        body: new URLSearchParams({ _method: 'PUT', quantity: qty })
    }).then(r=>r.json()).then(res=>{
        if(!res || !res.success) return false;
        if(typeof window.__updateCartCount === 'function'){
            window.__updateCartCount(res.cart.count);
        }
        const alertBox = form.closest('.alert');
        const stock = parseInt(alertBox.dataset.stock || '999999', 10);
        if(alertBox){
            alertBox.querySelector('div').innerHTML = `<i class=\"bi bi-check-circle me-2\"></i>Carted (${res.item.quantity} ${res.item.quantity>1?'items':'item'})`;
            const forms = alertBox.querySelectorAll('form');
            if(forms.length >= 2){
                const minusForm = forms[0];
                const plusForm = forms[1];
                const newQty = parseInt(res.item.quantity, 10);
                minusForm.querySelector('input[name=quantity]').value = Math.max(1, newQty - 1);
                plusForm.querySelector('input[name=quantity]').value = Math.min(stock, newQty + 1);
                minusForm.querySelector('button').disabled = newQty <= 1;
                plusForm.querySelector('button').disabled = newQty >= stock;
            }
        }
    }).catch(()=>{});
    return false;
}

function pdRemoveCartItemAjax(e, itemId, productId, stock){
    e.preventDefault();
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    fetch(`${window.location.origin}/cart/items/${itemId}`, {
        method: 'POST',
        headers: {
            'X-Requested-With': 'XMLHttpRequest',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': token
        },
        body: new URLSearchParams({ _method: 'DELETE' })
    }).then(r=>r.json()).then(res=>{
        if(!res || !res.success) return false;
        if(typeof window.__updateCartCount === 'function'){
            window.__updateCartCount(res.cart.count);
        }
        // Swap alert with Add to Cart form and remove any adjacent View Cart button
        const alertBox = document.querySelector('.alert.alert-success[data-item-id]');
        if(alertBox){
            const cardBody = alertBox.closest('.card-body') || alertBox.parentNode;
            cardBody && cardBody.querySelectorAll('.js-view-cart-btn').forEach(n=>n.remove());
            const formHtml = `
            <form action="{{ route('cart.add') }}" method="post" class="mb-4" onsubmit="return pdAddToCartAjax(event, this)" data-stock="${stock}">
                <input type="hidden" name="_token" value="${token}">
                <input type="hidden" name="product_id" value="${productId}">
                <div class="row align-items-end">
                    <div class="col-md-4 mb-3">
                        <label for="quantity" class="form-label fw-semibold">Quantity</label>
                        <input type="number" min="1" max="${stock}" name="quantity" value="1" class="form-control form-control-lg" id="quantity" required>
                    </div>
                    <div class="col-md-8 mb-3">
                        <button type="submit" class="btn btn-primary btn-lg w-100 btn-custom" ${stock <= 0 ? 'disabled' : ''}>
                            <i class="bi bi-cart-plus me-2"></i>
                            ${stock <= 0 ? 'Out of Stock' : 'Add to Cart'}
                        </button>
                    </div>
                </div>
            </form>`;
            const wrapper = document.createElement('div');
            wrapper.innerHTML = formHtml;
            alertBox.parentNode.replaceChild(wrapper.firstElementChild, alertBox);
        }
    }).catch(()=>{});
    return false;
}
</script>

 


