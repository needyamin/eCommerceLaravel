@extends('admin.layouts.app')

@section('content')
<div class="card">
    <div class="card-header d-flex flex-wrap gap-2 justify-content-between align-items-center">
        <h3 class="card-title m-0">All Users</h3>
        <div class="d-flex gap-2 align-items-center ms-auto">
            <input type="date" id="u_from" class="form-control form-control-sm" />
            <input type="date" id="u_to" class="form-control form-control-sm" />
        </div>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table id="usersTable" class="table table-bordered table-striped align-middle" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Addresses</th>
                        <th>Orders</th>
                        <th>Joined</th>
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
    const table = $('#usersTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '{{ route('admin.datatables', 'users') }}',
            data: function(d){
                d.from = document.getElementById('u_from').value || '';
                d.to = document.getElementById('u_to').value || '';
            }
        },
        order: [[0,'desc']],
        columns: [
            { data: 'id', name: 'id' },
            { data: 'name', name: 'name' },
            { data: 'email', name: 'email' },
            { data: 'phone', name: 'phone' },
            { data: 'addresses_count', name: 'addresses_count', orderable: true, searchable: false, className: 'text-center' },
            { data: 'orders_count', name: 'orders_count', orderable: true, searchable: false, className: 'text-center' },
            { data: 'created_at', name: 'created_at' },
            { data: 'actions', name: 'actions', orderable: false, searchable: false }
        ]
    });
    ['u_from','u_to'].forEach(id => document.getElementById(id).addEventListener('change', ()=>table.ajax.reload()));
});
</script>
@endpush
@endsection
