@extends('layouts.app')

@section('title', $product->name)

@section('content')
<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
	<div>
		<div class="aspect-[4/3] bg-gray-200 mb-4 flex items-center justify-center">Image</div>
	</div>
	<div>
		<h1 class="text-2xl font-bold mb-2">{{ $product->name }}</h1>
		<div class="text-gray-600 mb-4">${{ number_format($product->price, 2) }}</div>
		<div class="prose max-w-none mb-6">{!! nl2br(e($product->description)) !!}</div>
		<form action="{{ route('cart.add') }}" method="post" class="flex gap-2">
			@csrf
			<input type="hidden" name="product_id" value="{{ $product->id }}">
			<input type="number" min="1" name="quantity" value="1" class="border px-3 py-2 rounded w-24">
			<button class="px-4 py-2 bg-blue-600 text-white rounded">Add to Cart</button>
		</form>
	</div>
</div>

<h2 class="text-xl font-bold mt-10 mb-4">Related Products</h2>
<div class="grid grid-cols-2 md:grid-cols-4 gap-4">
	@foreach($related as $product)
		@include('products._card', ['product' => $product])
	@endforeach
</div>
@endsection


