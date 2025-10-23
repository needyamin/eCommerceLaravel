<div class="border rounded p-3">
	<a href="{{ route('products.show', $product->slug) }}" class="block">
		<div class="aspect-[4/3] bg-gray-200 mb-2 flex items-center justify-center">
			<span class="text-gray-500">Image</span>
		</div>
		<div class="font-semibold">{{ $product->name }}</div>
	</a>
	<div class="text-sm text-gray-600">${{ number_format($product->price, 2) }}</div>
	<form action="{{ route('cart.add') }}" method="post" class="mt-2">
		@csrf
		<input type="hidden" name="product_id" value="{{ $product->id }}">
		<button class="px-3 py-2 bg-blue-600 text-white rounded w-full">Add to Cart</button>
	</form>
</div>


