<nav class="bg-gray-100 border-b">
	<div class="container mx-auto px-4 py-3 flex items-center justify-between">
		<a href="{{ route('home') }}" class="font-bold">eCommerce</a>
		<form action="{{ route('products.index') }}" method="get" class="flex gap-2">
			<input name="q" value="{{ request('q') }}" placeholder="Search products..." class="border px-3 py-2 rounded w-64" />
			<button class="px-3 py-2 bg-blue-600 text-white rounded">Search</button>
		</form>
		<a href="{{ route('cart.index') }}">Cart</a>
	</div>
</nav>


