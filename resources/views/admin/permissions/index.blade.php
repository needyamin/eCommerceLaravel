@extends('admin.layouts.app')

@section('title', 'Permissions')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
	<h1 class="h4 m-0">Permissions</h1>
	<a href="{{ route('admin.permissions.create') }}" class="btn btn-primary">New Permission</a>
</div>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>Name</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		@foreach($permissions as $permission)
		<tr>
			<td>{{ $permission->name }}</td>
			<td>
				<a href="{{ route('admin.permissions.edit', $permission) }}" class="btn btn-sm btn-link">Edit</a>
				<form action="{{ route('admin.permissions.destroy', $permission) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this permission?')">
					@csrf
					@method('DELETE')
					<button class="btn btn-sm btn-link text-danger">Delete</button>
				</form>
			</td>
		</tr>
		@endforeach
	</tbody>
</table>

{{ $permissions->links() }}
@endsection


