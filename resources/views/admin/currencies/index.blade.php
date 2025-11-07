@extends('admin.layouts.app')

@section('title', 'Currencies')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-currency-exchange me-2"></i>Currencies</h1>
    <a href="{{ route('admin.currencies.create') }}" class="btn btn-primary"><i class="bi bi-plus-lg me-1"></i>Add Currency</a>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <div class="p-3 d-flex gap-2 align-items-center">
        <select id="f_curr_active" class="form-select form-select-sm" style="max-width: 160px;">
          <option value="">All Status</option>
          <option value="1">Active</option>
          <option value="0">Inactive</option>
        </select>
      </div>
      <div class="table-responsive">
        <table id="currenciesTable" class="table table-hover mb-0" style="width:100%">
          <thead class="table-light">
            <tr>
              <th>Code</th>
              <th>Name</th>
              <th>Rate</th>
              <th>Status</th>
              <th>Default</th>
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
  const table = $('#currenciesTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: '{{ route('admin.datatables', 'currencies') }}',
      data: function(d){ d.is_active = document.getElementById('f_curr_active').value || ''; }
    },
    order: [[1,'asc']],
    columns: [
      { data: 'code', name: 'code' },
      { data: 'name', name: 'name' },
      { data: 'rate', name: 'rate' },
      { data: 'is_active', name: 'is_active', searchable: false },
      { data: 'is_default', name: 'is_default', searchable: false },
      { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-end' }
    ]
  });
  document.getElementById('f_curr_active').addEventListener('change', ()=>table.ajax.reload());
});
</script>
@endpush
@endsection
