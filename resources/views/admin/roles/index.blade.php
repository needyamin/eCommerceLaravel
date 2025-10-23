@extends('admin.layouts.app')

@section('title', 'Roles')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
	<h1 class="h4 m-0">Roles</h1>
	<a href="{{ route('admin.roles.create') }}" class="btn btn-primary">New Role</a>
</div>

<table class="table table-bordered">
	<thead>
		<tr>
			<th>Name</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		@foreach($roles as $role)
		<tr>
			<td>{{ $role->name }}</td>
			<td>
				<a href="{{ route('admin.roles.edit', $role) }}" class="btn btn-sm btn-link">Edit</a>
				<form action="{{ route('admin.roles.destroy', $role) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this role?')">
					@csrf
					@method('DELETE')
					<button class="btn btn-sm btn-link text-danger">Delete</button>
				</form>
			</td>
		</tr>
		@endforeach
	</tbody>
</table>

{{ $roles->links() }}
@endsection


