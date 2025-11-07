@extends('admin.layouts.app')

@section('content')
<div class="card">
    <div class="card-header d-flex flex-wrap gap-2 justify-content-between align-items-center">
        <h3 class="card-title mb-0">All Orders</h3>
        <div class="d-flex gap-2 align-items-center ms-auto">
            <select id="f_order_status" class="form-select form-select-sm" style="min-width: 160px;">
                <option value="">All Status</option>
                <option value="pending">Pending</option>
                <option value="processing">Processing</option>
                <option value="cancelled">Cancelled</option>
                <option value="delivered">Delivered</option>
            </select>
            <select id="f_payment_status" class="form-select form-select-sm" style="min-width: 160px;">
                <option value="">All Payments</option>
                <option value="unpaid">Unpaid</option>
                <option value="paid">Paid</option>
                <option value="refunded">Refunded</option>
            </select>
            <input type="date" id="f_from" class="form-control form-control-sm" />
            <input type="date" id="f_to" class="form-control form-control-sm" />
            <a href="{{ route('admin.orders.create') }}" class="btn btn-sm btn-primary">
                <i class="bi bi-bag-plus me-1"></i> Create Order
            </a>
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table id="ordersTable" class="table table-bordered table-striped align-middle" style="width:100%">
                <thead>
                    <tr>
                        <th>Order #</th>
                        <th>Customer</th>
                        <th>Status</th>
                        <th>Payment</th>
                        <th>Shipping</th>
                        <th>Total</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function(){
    const table = $('#ordersTable').DataTable({
        processing: true,
        serverSide: true,
        order: [[6,'desc']],
        ajax: {
            url: '{{ route('admin.datatables', 'orders') }}',
            data: function(d){
                d.status = document.getElementById('f_order_status').value || '';
                d.payment_status = document.getElementById('f_payment_status').value || '';
                d.from = document.getElementById('f_from').value || '';
                d.to = document.getElementById('f_to').value || '';
            }
        },
        columns: [
            { data: 'number', name: 'number' },
            { data: 'customer', name: 'customer', orderable: false },
            { data: 'status', name: 'status', orderable: true, searchable: false },
            { data: 'payment_status', name: 'payment_status', orderable: true, searchable: false },
            { data: 'shipping_status', name: 'shipping_status', orderable: true, searchable: false },
            { data: 'grand_total', name: 'grand_total', searchable: false, className: 'text-end' },
            { data: 'created_at', name: 'created_at' },
            { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-center' }
        ]
    });
    ['f_order_status','f_payment_status','f_from','f_to'].forEach(id => document.getElementById(id).addEventListener('change', ()=>table.ajax.reload()))
});
</script>
@endpush
@endsection
