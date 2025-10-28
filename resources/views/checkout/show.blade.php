@extends('layouts.app')

@section('title', 'Checkout')

@section('content')
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="display-5 fw-bold mb-0">
                    <i class="bi bi-credit-card me-2"></i>Checkout
                </h1>
                <a href="{{ route('cart.index') }}" class="btn btn-outline-primary btn-custom">
                    <i class="bi bi-arrow-left me-2"></i>Back to Cart
                </a>
            </div>
        </div>
    </div>

    @if($cart->items->count() === 0)
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card border-0 shadow-sm text-center">
                    <div class="card-body py-5">
                        <i class="bi bi-cart-x display-1 text-muted mb-4"></i>
                        <h3 class="text-muted mb-3">Your cart is empty</h3>
                        <p class="text-muted mb-4">
                            You need to add items to your cart before proceeding to checkout.
                        </p>
                        <a href="{{ route('products.index') }}" class="btn btn-primary btn-lg btn-custom">
                            <i class="bi bi-grid me-2"></i>Start Shopping
                        </a>
                    </div>
                </div>
            </div>
        </div>
    @else
        <form action="{{ route('checkout.place') }}" method="post">
            @csrf
            <div class="row">
                <!-- Billing Information -->
                <div class="col-lg-8 mb-4">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0">
                                <i class="bi bi-person me-2"></i>Billing Information
                            </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="billing_name" class="form-label fw-semibold">
                                        <i class="bi bi-person me-1"></i>Full Name *
                                    </label>
                                    <input type="text" 
                                           class="form-control @error('billing_name') is-invalid @enderror" 
                                           id="billing_name" 
                                           name="billing_name" 
                                           value="{{ old('billing_name', auth()->user()->name ?? '') }}" 
                                           placeholder="Enter your full name" 
                                           required>
                                    @error('billing_name')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="billing_email" class="form-label fw-semibold">
                                        <i class="bi bi-envelope me-1"></i>Email Address *
                                    </label>
                                    <input type="email" 
                                           class="form-control @error('billing_email') is-invalid @enderror" 
                                           id="billing_email" 
                                           name="billing_email" 
                                           value="{{ old('billing_email', auth()->user()->email ?? '') }}" 
                                           placeholder="Enter your email" 
                                           required>
                                    @error('billing_email')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="billing_phone" class="form-label fw-semibold">
                                        <i class="bi bi-telephone me-1"></i>Phone Number
                                    </label>
                                    <input type="tel" 
                                           class="form-control @error('billing_phone') is-invalid @enderror" 
                                           id="billing_phone" 
                                           name="billing_phone" 
                                           value="{{ old('billing_phone', auth()->user()->phone ?? '') }}" 
                                           placeholder="Enter your phone number">
                                    @error('billing_phone')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="billing_country" class="form-label fw-semibold">
                                        <i class="bi bi-globe me-1"></i>Country
                                    </label>
                                    <select class="form-select @error('billing_country') is-invalid @enderror" 
                                            id="billing_country" 
                                            name="billing_country">
                                        <option value="United States" {{ old('billing_country', 'United States') == 'United States' ? 'selected' : '' }}>United States</option>
                                        <option value="Canada" {{ old('billing_country') == 'Canada' ? 'selected' : '' }}>Canada</option>
                                        <option value="United Kingdom" {{ old('billing_country') == 'United Kingdom' ? 'selected' : '' }}>United Kingdom</option>
                                        <option value="Australia" {{ old('billing_country') == 'Australia' ? 'selected' : '' }}>Australia</option>
                                    </select>
                                    @error('billing_country')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="billing_address" class="form-label fw-semibold">
                                    <i class="bi bi-geo-alt me-1"></i>Address
                                </label>
                                <input type="text" 
                                       class="form-control @error('billing_address') is-invalid @enderror" 
                                       id="billing_address" 
                                       name="billing_address" 
                                       value="{{ old('billing_address') }}" 
                                       placeholder="Enter your address">
                                @error('billing_address')
                                    <div class="invalid-feedback">
                                        <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                    </div>
                                @enderror
                            </div>
                            
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="billing_city" class="form-label fw-semibold">
                                        <i class="bi bi-building me-1"></i>City
                                    </label>
                                    <input type="text" 
                                           class="form-control @error('billing_city') is-invalid @enderror" 
                                           id="billing_city" 
                                           name="billing_city" 
                                           value="{{ old('billing_city') }}" 
                                           placeholder="City">
                                    @error('billing_city')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                
                                <div class="col-md-4 mb-3">
                                    <label for="billing_postcode" class="form-label fw-semibold">
                                        <i class="bi bi-mailbox me-1"></i>Postal Code
                                    </label>
                                    <input type="text" 
                                           class="form-control @error('billing_postcode') is-invalid @enderror" 
                                           id="billing_postcode" 
                                           name="billing_postcode" 
                                           value="{{ old('billing_postcode') }}" 
                                           placeholder="Postal Code">
                                    @error('billing_postcode')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                                
                                <div class="col-md-4 mb-3">
                                    <label for="billing_state" class="form-label fw-semibold">
                                        <i class="bi bi-geo me-1"></i>State/Province
                                    </label>
                                    <input type="text" 
                                           class="form-control @error('billing_state') is-invalid @enderror" 
                                           id="billing_state" 
                                           name="billing_state" 
                                           value="{{ old('billing_state') }}" 
                                           placeholder="State/Province">
                                    @error('billing_state')
                                        <div class="invalid-feedback">
                                            <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Method -->
                    <div class="card border-0 shadow-sm mt-4">
                        <div class="card-header bg-success text-white">
                            <h5 class="mb-0">
                                <i class="bi bi-credit-card me-2"></i>Payment Method
                            </h5>
                        </div>
                        <div class="card-body">
                            @php
                                $hasStripe = isset($gateways['stripe']);
                                $hasPaypal = isset($gateways['paypal']);
                                $hasCod = true; // Always enable COD for guest or logged-in users
                            @endphp

                            @if(!$hasStripe && !$hasPaypal && !$hasCod)
                                <div class="alert alert-warning">
                                    <i class="bi bi-exclamation-triangle me-2"></i>
                                    No payment gateways are enabled. Please contact support.
                                </div>
                            @endif
                            <div class="row g-3">
                                    @if($hasStripe)
                                        <div class="col-md-6">
                                            <div class="form-check border rounded p-3 h-100">
                                                <input class="form-check-input" type="radio" name="gateway" id="gateway_stripe" value="stripe" {{ old('gateway') === 'stripe' ? 'checked' : '' }}>
                                                <label class="form-check-label" for="gateway_stripe">
                                                    <i class="bi bi-credit-card me-2"></i>Stripe
                                                </label>
                                                <div class="text-muted small mt-2">Pay securely with your card via Stripe.</div>
                                            </div>
                                        </div>
                                    @endif

                                    @if($hasPaypal)
                                        <div class="col-md-6">
                                            <div class="form-check border rounded p-3 h-100">
                                                <input class="form-check-input" type="radio" name="gateway" id="gateway_paypal" value="paypal" {{ old('gateway') === 'paypal' ? 'checked' : '' }}>
                                                <label class="form-check-label" for="gateway_paypal">
                                                    <i class="bi bi-paypal me-2"></i>PayPal
                                                </label>
                                                <div class="text-muted small mt-2">Checkout quickly with your PayPal account.</div>
                                            </div>
                                        </div>
                                    @endif
                                    <div class="col-md-6">
                                        <div class="form-check border rounded p-3 h-100">
                                            <input class="form-check-input" type="radio" name="gateway" id="gateway_cod" value="cod" {{ old('gateway', (!$hasStripe && !$hasPaypal) ? 'cod' : '') === 'cod' ? 'checked' : '' }}>
                                            <label class="form-check-label" for="gateway_cod">
                                                <i class="bi bi-truck me-2"></i>Cash on Delivery
                                            </label>
                                            <div class="text-muted small mt-2">Pay with cash upon delivery.</div>
                                        </div>
                                    </div>
                            </div>
                            @error('gateway')
                                <div class="invalid-feedback d-block">
                                    <i class="bi bi-exclamation-triangle me-1"></i>{{ $message }}
                                </div>
                            @enderror
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
                            <!-- Order Items -->
                            <div class="mb-3">
                                <h6 class="fw-semibold mb-2">Items in your order:</h6>
                                @foreach($cart->items as $item)
                                    <div class="d-flex justify-content-between align-items-center mb-2 pb-2 border-bottom">
                                        <div>
                                            <small class="fw-semibold">{{ $item->product->name }}</small>
                                            <br>
                                            <small class="text-muted">Qty: {{ $item->quantity }}</small>
                                        </div>
                                        <div class="text-end">
                                            <small class="fw-semibold">@currency($item->line_total)</small>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            
                            <!-- Order Totals -->
                            <div class="mb-3">
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
                                    <span>@currency($shipping ?? 0)</span>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between mb-4">
                                    <span class="fw-bold fs-5">Total</span>
                                    <span class="fw-bold fs-5 text-primary">@currency($cart->grand_total + ($shipping ?? 0))</span>
                                </div>
                            </div>
                            
                            <!-- Place Order Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success btn-lg btn-custom">
                                    <i class="bi bi-check-circle me-2"></i>Place Order
                                </button>
                            </div>
                            
                            <div class="text-center mt-3">
                                <small class="text-muted">
                                    <i class="bi bi-shield-check me-1"></i>
                                    Your payment information is secure and encrypted
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    @endif
</div>
@endsection


