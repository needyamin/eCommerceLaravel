@extends('admin.layouts.app')

@section('title', 'Administrators')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h4 mb-0"><i class="bi bi-shield-lock me-2"></i>Administrators</h1>
  <a href="{{ route('admin.admins.create') }}" class="btn btn-primary btn-sm"><i class="bi bi-plus-lg me-1"></i>Add Admin</a>
  </div>

<div class="card">
  <div class="card-body p-0">
    <div class="table-responsive">
      <table id="adminsTable" class="table table-striped mb-0" style="width:100%">
        <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Roles</th><th></th></tr></thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
  $('#adminsTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: { url: '{{ route('admin.datatables', 'admins') }}' },
    order: [[0,'desc']],
    columns: [
      { data: 'id', name: 'id' },
      { data: 'name', name: 'name' },
      { data: 'email', name: 'email' },
      { data: 'roles', name: 'roles', orderable: false, searchable: false },
      { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-end' }
    ]
  });
});
</script>
@endpush
@endsection


