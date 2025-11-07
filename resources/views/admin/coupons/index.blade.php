@extends('admin.layouts.app')

@section('title', 'Coupons')

@section('content_header')
    <h1 class="h3 mb-0 text-gray-800">Coupons</h1>
@stop

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-wrap gap-2 justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">Coupon List</h6>
                    <div class="d-flex gap-2 ms-auto">
                        <select id="f_coupon_type" class="form-select form-select-sm" style="min-width: 160px;">
                            <option value="">All Types</option>
                            <option value="percentage">Percentage</option>
                            <option value="fixed">Fixed</option>
                        </select>
                        <select id="f_coupon_active" class="form-select form-select-sm" style="min-width: 140px;">
                            <option value="">All Status</option>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                        <a href="{{ route('admin.coupons.create') }}" class="btn btn-primary btn-sm">
                            <i class="bi bi-plus me-1"></i>Add New Coupon
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered align-middle" id="couponsTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Value</th>
                                    <th>Usage</th>
                                    <th>Status</th>
                                    <th>Expires</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
  const table = $('#couponsTable').DataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: '{{ route('admin.datatables', 'coupons') }}',
      data: function(d){
        d.type = document.getElementById('f_coupon_type').value || '';
        d.is_active = document.getElementById('f_coupon_active').value || '';
      }
    },
    order: [[6,'desc']],
    columns: [
      { data: 'code', name: 'code' },
      { data: 'name', name: 'name' },
      { data: 'type', name: 'type' },
      { data: 'value', name: 'value', searchable: false },
      { data: 'usages_count', name: 'usages_count', searchable: false, className: 'text-center' },
      { data: 'is_active', name: 'is_active', searchable: false },
      { data: 'expires_at', name: 'expires_at' },
      { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-end' },
    ]
  });
  ['f_coupon_type','f_coupon_active'].forEach(id => document.getElementById(id).addEventListener('change', ()=>table.ajax.reload()));
});
</script>
@endpush
@stop
