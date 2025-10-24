@extends('layouts.app')

@section('title', 'Your Cart')

@section('content')
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="display-5 fw-bold mb-0">
                    <i class="bi bi-cart me-2"></i>Your Cart
                </h1>
                <a href="{{ route('products.index') }}" class="btn btn-outline-primary btn-custom">
                    <i class="bi bi-arrow-left me-2"></i>Continue Shopping
                </a>
            </div>
        </div>
    </div>

    @if($cart->items->isEmpty())
        <!-- Empty Cart -->
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card border-0 shadow-sm text-center">
                    <div class="card-body py-5">
                        <i class="bi bi-cart-x display-1 text-muted mb-4"></i>
                        <h3 class="text-muted mb-3">Your cart is empty</h3>
                        <p class="text-muted mb-4">
                            Looks like you haven't added any items to your cart yet. 
                            Start shopping to fill it up!
                        </p>
                        <a href="{{ route('products.index') }}" class="btn btn-primary btn-lg btn-custom">
                            <i class="bi bi-grid me-2"></i>Start Shopping
                        </a>
                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="row">
            <!-- Cart Items -->
            <div class="col-lg-8 mb-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">
                            <i class="bi bi-list-ul me-2"></i>Cart Items ({{ $cart->items->count() }})
                        </h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th class="border-0">Product</th>
                                        <th class="border-0">Price</th>
                                        <th class="border-0">Quantity</th>
                                        <th class="border-0">Total</th>
                                        <th class="border-0">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($cart->items as $item)
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="me-3">
                                                        @if($item->product->images->count() > 0)
                                                            <img src="{{ asset('storage/' . $item->product->images->first()->image_path) }}" 
                                                                 alt="{{ $item->product->name }}" 
                                                                 class="rounded" 
                                                                 style="width: 60px; height: 60px; object-fit: cover;">
                                                        @else
                                                            <div class="bg-light rounded d-flex align-items-center justify-content-center" 
                                                                 style="width: 60px; height: 60px;">
                                                                <i class="bi bi-image text-muted"></i>
                                                            </div>
                                                        @endif
                                                    </div>
                                                    <div>
                                                        <h6 class="mb-1">
                                                            <a href="{{ route('products.show', $item->product->slug) }}" 
                                                               class="text-decoration-none text-dark">
                                                                {{ $item->product->name }}
                                                            </a>
                                                        </h6>
                                                        <small class="text-muted">{{ $item->product->sku }}</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                    <span class="fw-semibold">@currency($item->unit_price)</span>
                                            </td>
                                            <td>
                                                <form action="{{ route('cart.items.update', $item->id) }}" method="post" class="d-flex align-items-center">
                                                    @csrf
                                                    @method('PUT')
                                                    <div class="input-group" style="width: 120px;">
                                                        <input type="number" name="quantity" min="1" max="{{ $item->product->stock }}" 
                                                               value="{{ $item->quantity }}" 
                                                               class="form-control form-control-sm text-center">
                                                        <button type="submit" class="btn btn-outline-primary btn-sm">
                                                            <i class="bi bi-check"></i>
                                                        </button>
                                                    </div>
                                                </form>
                                            </td>
                                            <td>
                                                    <span class="fw-bold text-primary">@currency($item->line_total)</span>
                                            </td>
                                            <td>
                                                <form action="{{ route('cart.items.remove', $item->id) }}" method="post" class="d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-outline-danger btn-sm" 
                                                            onclick="return confirm('Are you sure you want to remove this item?')">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="col-lg-4">
                <div class="card border-0 shadow-sm sticky-top" style="top: 100px;">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">
                            <i class="bi bi-receipt me-2"></i>Order Summary
                        </h5>
                    </div>
                    <div class="card-body">
                        <!-- Coupon Section -->
                        <div class="mb-4">
                            <h6 class="fw-semibold mb-2">
                                <i class="bi bi-ticket me-1"></i>Coupon Code
                            </h6>
                            @if($cart->coupon)
                                <div class="alert alert-success py-2 mb-2">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <strong>{{ $cart->coupon->code }}</strong>
                                            <br>
                                            <small>{{ $cart->coupon->name }}</small>
                                        </div>
                                        <form action="{{ route('coupons.remove') }}" method="post" class="d-inline">
                                            @csrf
                                            <button type="submit" class="btn btn-outline-danger btn-sm">
                                                <i class="bi bi-x"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            @else
                                <form id="couponForm" class="d-flex gap-2">
                                    @csrf
                                    <input type="text" 
                                           id="couponCode" 
                                           class="form-control form-control-sm" 
                                           placeholder="Enter coupon code"
                                           maxlength="50">
                                    <button type="submit" class="btn btn-outline-primary btn-sm">
                                        <i class="bi bi-check"></i>
                                    </button>
                                </form>
                                <div id="couponMessage" class="mt-2"></div>
                            @endif
                        </div>

                        <div class="d-flex justify-content-between mb-2">
                            <span>Subtotal</span>
                                <span>@currency($cart->subtotal)</span>
                        </div>
                        @if($cart->coupon_discount > 0)
                            <div class="d-flex justify-content-between mb-2">
                                <span class="text-success">
                                    <i class="bi bi-ticket me-1"></i>Discount ({{ $cart->coupon->code }})
                                </span>
                                    <span class="text-success">-@currency($cart->coupon_discount)</span>
                            </div>
                        @endif
                        <div class="d-flex justify-content-between mb-2">
                            <span>Tax</span>
                                <span>@currency($cart->tax_total)</span>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <span>Shipping</span>
                            <span class="text-success">FREE</span>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-4">
                            <span class="fw-bold fs-5">Total</span>
                                <span class="fw-bold fs-5 text-primary">@currency($cart->grand_total)</span>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <a href="{{ route('checkout.show') }}" class="btn btn-success btn-lg btn-custom">
                                <i class="bi bi-credit-card me-2"></i>Proceed to Checkout
                            </a>
                            <a href="{{ route('products.index') }}" class="btn btn-outline-primary btn-custom">
                                <i class="bi bi-arrow-left me-2"></i>Continue Shopping
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif
</div>
@endsection

<script>
document.addEventListener('DOMContentLoaded', function() {
    const couponForm = document.getElementById('couponForm');
    const couponCode = document.getElementById('couponCode');
    const couponMessage = document.getElementById('couponMessage');

    if (couponForm) {
        couponForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const code = couponCode.value.trim();
            if (!code) {
                showMessage('Please enter a coupon code.', 'danger');
                return;
            }

            // Show loading state
            const submitBtn = couponForm.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            submitBtn.innerHTML = '<i class="bi bi-hourglass-split"></i>';
            submitBtn.disabled = true;

            // Get CSRF token
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            fetch('{{ route("coupons.apply") }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken,
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ code: code })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    showMessage(data.message, 'success');
                    // Reload page to show updated cart
                    setTimeout(() => {
                        window.location.reload();
                    }, 1500);
                } else {
                    showMessage(data.message, 'danger');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showMessage('An error occurred. Please try again.', 'danger');
            })
            .finally(() => {
                submitBtn.innerHTML = originalText;
                submitBtn.disabled = false;
            });
        });
    }

    function showMessage(message, type) {
        couponMessage.innerHTML = `<div class="alert alert-${type} alert-dismissible fade show" role="alert">
            <i class="bi bi-${type === 'success' ? 'check-circle' : 'exclamation-triangle'} me-2"></i>
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>`;
    }
});
</script>


