@extends('admin.layouts.app')

@section('title', 'Products')

@section('content')
<div class="card">
	<div class="card-header d-flex justify-content-between align-items-center">
		<h3 class="card-title m-0">Products</h3>
		<a href="{{ route('admin.products.create') }}" class="btn btn-primary">New Product</a>
	</div>
	<div class="card-body p-0">
		<table class="table table-striped mb-0">
			<thead>
				<tr>
					<th>Name</th>
					<th class="text-center">Category</th>
					<th class="text-center">Price</th>
					<th class="text-center">Active</th>
					<th class="text-center" style="width:160px">Actions</th>
				</tr>
			</thead>
			<tbody>
			@foreach($products as $product)
				<tr>
					<td>{{ $product->name }}</td>
					<td class="text-center">{{ optional($product->category)->name }}</td>
					<td class="text-center">${{ number_format($product->price, 2) }}</td>
					<td class="text-center">
						<span class="badge {{ $product->is_active ? 'text-bg-success' : 'text-bg-secondary' }}">{{ $product->is_active ? 'Yes' : 'No' }}</span>
					</td>
					<td class="text-center">
						<a href="{{ route('admin.products.edit', $product) }}" class="btn btn-sm btn-outline-primary">Edit</a>
						<form action="{{ route('admin.products.destroy', $product) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this product?')">
							@csrf
							@method('DELETE')
							<button class="btn btn-sm btn-outline-danger">Delete</button>
						</form>
					</td>
				</tr>
			@endforeach
			</tbody>
		</table>
	</div>
	<div class="card-footer">{{ $products->links() }}</div>
</div>
@endsection


