@extends('admin.layouts.app')

@section('title', 'New Role')

@section('content')
<h1 class="h4 mb-3">New Role</h1>
<form action="{{ route('admin.roles.store') }}" method="post">
	@csrf
	<div class="mb-3">
		<label class="form-label">Name</label>
		<input name="name" class="form-control" required />
	</div>
	<div class="mb-3">
		<label class="form-label">Permissions</label>
		<div class="row">
			@foreach($permissions as $permission)
				<div class="col-md-3">
					<label class="form-check">
						<input type="checkbox" class="form-check-input" name="permissions[]" value="{{ $permission->name }}" />
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
				<div class="col-md-4">
					<label class="form-check">
						<input type="checkbox" class="form-check-input" name="permissions[]" value="{{ $r }}" />
						<span class="form-check-label">{{ $r }}</span>
					</label>
				</div>
			@endforeach
		</div>
	</div>
	<button class="btn btn-primary">Create</button>
</form>
@endsection


