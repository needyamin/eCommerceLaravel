@extends('admin.layouts.app')

@section('title', 'Newsletter')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h1 class="h3 mb-0"><i class="bi bi-envelope-paper me-2"></i>Newsletter Subscribers</h1>
    <a href="{{ route('admin.site-settings.index') }}#newsletter-settings" class="btn btn-outline-primary btn-sm">
      <i class="bi bi-gear me-1"></i>Newsletter Settings
    </a>
  </div>

  <div class="card shadow-sm">
    <div class="card-header d-flex justify-content-between align-items-center">
      <h5 class="mb-0"><i class="bi bi-people me-2"></i>Subscribers</h5>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        <div class="p-3 d-flex gap-2 align-items-center">
          <select id="f_sub_status" class="form-select form-select-sm" style="max-width: 180px;">
            <option value="">All Status</option>
            <option value="subscribed">Subscribed</option>
            <option value="unsubscribed">Unsubscribed</option>
          </select>
        </div>
        <table id="subsTable" class="table table-hover mb-0" style="width:100%">
          <thead class="table-light">
            <tr>
              <th>Email</th>
              <th>Name</th>
              <th>Status</th>
              <th>Source</th>
              <th>Subscribed</th>
              <th class="text-end">Actions</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
    </div>
  </div>
</div>
@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
  const table = $('#subsTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: '{{ route('admin.datatables', 'newsletter') }}',
      data: function(d){ d.status = document.getElementById('f_sub_status').value || ''; }
    },
    columns: [
      { data: 'email', name: 'email' },
      { data: 'name', name: 'name' },
      { data: 'status', name: 'status', searchable: false },
      { data: 'source', name: 'source', searchable: false },
      { data: 'subscribed_at', name: 'subscribed_at' },
      { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-end' },
    ]
  });
  document.getElementById('f_sub_status').addEventListener('change', ()=>table.ajax.reload());
});
</script>
@endpush
@endsection
