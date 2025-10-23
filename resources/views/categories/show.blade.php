@extends('layouts.app')

@section('title', $category->name)

@section('content')
<h1 class="text-2xl font-bold mb-4">{{ $category->name }}</h1>
<div class="grid grid-cols-2 md:grid-cols-4 gap-4">
	@foreach($products as $product)
		@include('products._card', ['product' => $product])
	@endforeach
</div>

<div class="mt-6">{{ $products->links() }}</div>
@endsection


