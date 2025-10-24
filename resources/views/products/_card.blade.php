<div class="card product-card h-100 border-0 shadow-sm">
    <div class="position-relative">
        <div class="card-img-top bg-light d-flex align-items-center justify-content-center" style="height: 200px;">
            @if($product->images->count() > 0)
                <img src="{{ asset('storage/' . $product->images->first()->image_path) }}" 
                     alt="{{ $product->name }}" 
                     class="img-fluid" 
                     style="max-height: 180px; object-fit: cover;">
            @else
                <i class="bi bi-image text-muted fs-1"></i>
            @endif
        </div>
        @if($product->is_featured)
            <span class="position-absolute top-0 start-0 badge bg-warning text-dark m-2">
                <i class="bi bi-star-fill me-1"></i>Featured
            </span>
        @endif
        @if($product->compare_at_price && $product->compare_at_price > $product->price)
            @php
                $discount = round((($product->compare_at_price - $product->price) / $product->compare_at_price) * 100);
            @endphp
            <span class="position-absolute top-0 end-0 badge bg-danger m-2">
                -{{ $discount }}%
            </span>
        @endif
    </div>
    
    <div class="card-body d-flex flex-column">
        <h6 class="card-title">
            <a href="{{ route('products.show', $product->slug) }}" class="text-decoration-none text-dark">
                {{ $product->name }}
            </a>
        </h6>
        
        <p class="card-text text-muted small flex-grow-1">
            {{ Str::limit($product->short_description, 80) }}
        </p>
        
        <div class="d-flex align-items-center justify-content-between mb-3">
            <div>
                    <span class="h5 text-primary mb-0">@currency($product->price)</span>
                @if($product->compare_at_price && $product->compare_at_price > $product->price)
                    <small class="text-muted text-decoration-line-through ms-2">
                            @currency($product->compare_at_price)
                    </small>
                @endif
            </div>
            @if($product->stock > 0)
                <small class="text-success">
                    <i class="bi bi-check-circle me-1"></i>In Stock
                </small>
            @else
                <small class="text-danger">
                    <i class="bi bi-x-circle me-1"></i>Out of Stock
                </small>
            @endif
        </div>
        
        <form action="{{ route('cart.add') }}" method="post">
            @csrf
            <input type="hidden" name="product_id" value="{{ $product->id }}">
            <button class="btn btn-primary w-100 btn-custom" 
                    {{ $product->stock <= 0 ? 'disabled' : '' }}>
                <i class="bi bi-cart-plus me-2"></i>
                {{ $product->stock <= 0 ? 'Out of Stock' : 'Add to Cart' }}
            </button>
        </form>
    </div>
</div>


