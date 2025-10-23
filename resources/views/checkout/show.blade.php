@extends('layouts.app')

@section('title', 'Checkout')

@section('content')
<div class="container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold mb-8">Checkout</h1>

    @if($cart->items->count() === 0)
        <div class="bg-yellow-100 border border-yellow-400 text-yellow-700 px-4 py-3 rounded">
            Your cart is empty. <a href="{{ route('products.index') }}" class="underline">Continue shopping</a>
        </div>
    @else
        <form action="{{ route('checkout.place') }}" method="post" class="grid grid-cols-1 lg:grid-cols-2 gap-8">
            @csrf
            <div>
                <h2 class="text-xl font-semibold mb-6">Billing Details</h2>
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Full Name *</label>
                        <input name="billing_name" placeholder="Enter your full name" 
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                               value="{{ old('billing_name', auth()->user()->name ?? '') }}" required />
                        @error('billing_name')
                            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                        @enderror
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Email Address *</label>
                        <input name="billing_email" type="email" placeholder="Enter your email" 
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                               value="{{ old('billing_email', auth()->user()->email ?? '') }}" required />
                        @error('billing_email')
                            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                        @enderror
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                        <input name="billing_phone" placeholder="Enter your phone number" 
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                               value="{{ old('billing_phone') }}" />
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                        <input name="billing_address" placeholder="Enter your address" 
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                               value="{{ old('billing_address') }}" />
                    </div>
                    
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">City</label>
                            <input name="billing_city" placeholder="City" 
                                   class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                   value="{{ old('billing_city') }}" />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Postal Code</label>
                            <input name="billing_postcode" placeholder="Postal Code" 
                                   class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                   value="{{ old('billing_postcode') }}" />
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Country</label>
                        <input name="billing_country" placeholder="Country" 
                               class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" 
                               value="{{ old('billing_country', 'United States') }}" />
                    </div>
                </div>
            </div>
            
            <div>
                <h2 class="text-xl font-semibold mb-6">Order Summary</h2>
                <div class="bg-gray-50 rounded-lg p-6">
                    @foreach($cart->items as $item)
                        <div class="flex justify-between items-center mb-4 pb-4 border-b border-gray-200">
                            <div>
                                <h3 class="font-medium">{{ $item->product->name }}</h3>
                                <p class="text-sm text-gray-600">Quantity: {{ $item->quantity }}</p>
                            </div>
                            <div class="text-right">
                                <p class="font-medium">${{ number_format($item->line_total, 2) }}</p>
                                <p class="text-sm text-gray-600">${{ number_format($item->unit_price, 2) }} each</p>
                            </div>
                        </div>
                    @endforeach
                    
                    <div class="space-y-2 mt-6">
                        <div class="flex justify-between">
                            <span>Subtotal</span>
                            <span>${{ number_format($cart->subtotal, 2) }}</span>
                        </div>
                        <div class="flex justify-between">
                            <span>Tax</span>
                            <span>${{ number_format($cart->tax_total, 2) }}</span>
                        </div>
                        <div class="flex justify-between">
                            <span>Shipping</span>
                            <span>$0.00</span>
                        </div>
                        <hr class="my-2">
                        <div class="flex justify-between text-lg font-bold">
                            <span>Total</span>
                            <span>${{ number_format($cart->grand_total, 2) }}</span>
                        </div>
                    </div>
                    
                    <button type="submit" class="w-full mt-6 bg-green-600 text-white py-3 px-4 rounded-md hover:bg-green-700 transition-colors font-medium">
                        Place Order
                    </button>
                </div>
            </div>
        </form>
    @endif
</div>
@endsection


