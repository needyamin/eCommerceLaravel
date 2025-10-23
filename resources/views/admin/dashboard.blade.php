@extends('admin.layouts.app')

@section('title', 'Dashboard')

@section('content')
<h1 class="text-2xl font-bold mb-4">Dashboard</h1>
<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
	<div class="border rounded p-4"><div class="text-sm text-gray-600">Orders</div><div class="text-2xl font-bold">{{ $stats['orders'] }}</div></div>
	<div class="border rounded p-4"><div class="text-sm text-gray-600">Products</div><div class="text-2xl font-bold">{{ $stats['products'] }}</div></div>
	<div class="border rounded p-4"><div class="text-sm text-gray-600">Categories</div><div class="text-2xl font-bold">{{ $stats['categories'] }}</div></div>
</div>
@endsection


