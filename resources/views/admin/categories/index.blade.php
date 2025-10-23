@extends('admin.layouts.app')

@section('title', 'Categories')

@section('content')
<div class="card">
	<div class="card-header d-flex justify-content-between align-items-center">
		<h3 class="card-title m-0">Categories</h3>
		<a href="{{ route('admin.categories.create') }}" class="btn btn-primary">New Category</a>
	</div>
	<div class="card-body p-0">
		<table class="table table-striped mb-0">
			<thead>
				<tr>
					<th>Name</th>
					<th class="text-center">Slug</th>
					<th class="text-center">Active</th>
					<th class="text-center" style="width:160px">Actions</th>
				</tr>
			</thead>
			<tbody>
			@foreach($categories as $category)
				<tr>
					<td>{{ $category->name }}</td>
					<td class="text-center">{{ $category->slug }}</td>
					<td class="text-center">
						<span class="badge {{ $category->is_active ? 'text-bg-success' : 'text-bg-secondary' }}">{{ $category->is_active ? 'Yes' : 'No' }}</span>
					</td>
					<td class="text-center">
						<a href="{{ route('admin.categories.edit', $category) }}" class="btn btn-sm btn-outline-primary">Edit</a>
						<form action="{{ route('admin.categories.destroy', $category) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this category?')">
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
	<div class="card-footer">{{ $categories->links() }}</div>
</div>
@endsection


