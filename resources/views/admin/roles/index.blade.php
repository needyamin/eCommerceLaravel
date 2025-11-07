@extends('admin.layouts.app')

@section('title', 'Roles')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h4 m-0">Roles</h1>
    <a href="{{ route('admin.roles.create') }}" class="btn btn-primary">New Role</a>
  </div>

<div class="card">
  <div class="card-body p-0">
    <div class="table-responsive">
      <table id="rolesTable" class="table table-bordered mb-0" style="width:100%">
        <thead>
          <tr><th>Name</th><th>Actions</th></tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
  $('#rolesTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: { url: '{{ route('admin.datatables', 'roles') }}' },
    columns: [
      { data: 'name', name: 'name' },
      { data: 'actions', name: 'actions', orderable: false, searchable: false }
    ]
  });
});
</script>
@endpush
@endsection


