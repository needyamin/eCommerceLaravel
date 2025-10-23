@extends('admin.layouts.app')

@section('title', 'New Category')

@section('content')
<div class="card">
	<div class="card-header">
		<h3 class="card-title m-0">New Category</h3>
	</div>
	<form action="{{ route('admin.categories.store') }}" method="post">
		@csrf
		<div class="card-body">
			<div class="row g-3">
				<div class="col-md-6">
					<label class="form-label">Name</label>
					<input name="name" class="form-control" required />
				</div>
				<div class="col-md-6">
					<label class="form-label">Slug</label>
					<input name="slug" class="form-control" required />
				</div>
				<div class="col-12">
					<label class="form-label">Parent</label>
					<select name="parent_id" class="form-select">
						<option value="">None</option>
						@foreach($parents as $id => $name)
							<option value="{{ $id }}">{{ $name }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-12">
					<label class="form-label">Description</label>
					<textarea name="description" rows="4" class="form-control"></textarea>
				</div>
				<div class="col-md-3">
					<div class="form-check mt-4">
						<input class="form-check-input" type="checkbox" name="is_active" id="is_active_new_cat" checked />
						<label class="form-check-label" for="is_active_new_cat"> Active </label>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<button class="btn btn-primary">Create</button>
		</div>
	</form>
</div>
@endsection


