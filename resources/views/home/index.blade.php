@extends('layouts.app')

@section('title', 'Home')

@section('content')
<h1 class="text-2xl font-bold mb-4">Featured Products</h1>
<div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
	@foreach($featuredProducts as $product)
		@include('products._card', ['product' => $product])
	@endforeach
</div>

<h2 class="text-2xl font-bold mb-4">Latest</h2>
<div class="grid grid-cols-2 md:grid-cols-4 gap-4">
	@foreach($latestProducts as $product)
		@include('products._card', ['product' => $product])
	@endforeach
</div>
@endsection


