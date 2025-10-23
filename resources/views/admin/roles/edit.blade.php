@extends('admin.layouts.app')

@section('title', 'Edit Role')

@section('content')
<h1 class="h4 mb-3">Edit Role</h1>
<form action="{{ route('admin.roles.update', $role) }}" method="post">
	@csrf
	@method('PUT')
	<div class="mb-3">
		<label class="form-label">Name</label>
		<input name="name" class="form-control" required value="{{ old('name', $role->name) }}" />
	</div>
	<div class="mb-3">
		<label class="form-label">Permissions</label>
		<div class="row">
			@foreach($permissions as $permission)
				<div class="col-md-3">
					<label class="form-check">
						<input type="checkbox" class="form-check-input" name="permissions[]" value="{{ $permission->name }}" @checked(in_array($permission->id, $assigned)) />
						<span class="form-check-label">{{ $permission->name }}</span>
					</label>
				</div>
			@endforeach
		</div>
	</div>
	<div class="mb-3">
		<label class="form-label">Route Permissions (auto-from route names)</label>
		<div class="row" style="max-height:260px;overflow:auto;border:1px solid #e5e5e5;padding:8px;border-radius:4px;">
			@foreach($routeNames as $r)
				@php($checked = $role->hasPermissionTo($r))
				<div class="col-md-4">
					<label class="form-check">
						<input type="checkbox" class="form-check-input" name="permissions[]" value="{{ $r }}" @checked($checked) />
						<span class="form-check-label">{{ $r }}</span>
					</label>
				</div>
			@endforeach
		</div>
	</div>
	<button class="btn btn-primary">Save</button>
</form>
@endsection


