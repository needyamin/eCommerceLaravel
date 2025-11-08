@extends('admin.layouts.app')

@section('title', 'Products')

@section('content')
<div class="card shadow-sm">
    <div class="card-header bg-white border-bottom">
        <div class="d-flex flex-wrap gap-3 justify-content-between align-items-center">
            <h3 class="card-title mb-0 fw-semibold">Products</h3>
            <div class="d-flex gap-2 align-items-center flex-wrap">
                <div class="filter-group">
                    <select id="filter_category" class="form-select form-select-sm filter-select">
                        <option value="">All Categories</option>
                        @foreach(\App\Models\Category::orderBy('name')->get(['id','name']) as $c)
                            <option value="{{ $c->id }}">{{ $c->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="filter-group">
                    <select id="filter_active" class="form-select form-select-sm filter-select">
                        <option value="">All Status</option>
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>
                <a href="{{ route('admin.products.create') }}" class="btn btn-primary btn-sm">
                    <i class="bi bi-plus-circle me-1"></i>New Product
                </a>
            </div>
        </div>
    </div>
    <div class="card-body p-3">
        <div class="table-responsive">
            <table id="productsTable" class="table table-striped mb-0 align-middle" style="width:100%">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Active</th>
                        <th style="width:160px">Actions</th>
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
    const table = $('#productsTable').DataTable({
        processing: true,
        serverSide: true,
        searching: true,
        lengthChange: true,
        ajax: {
            url: '{{ route('admin.datatables', 'products') }}',
            data: function(d){
                d.category_id = document.getElementById('filter_category').value || '';
                d.is_active = document.getElementById('filter_active').value || '';
            }
        },
        columns: [
            { data: 'name', name: 'name' },
            { data: 'category', name: 'category', orderable: true, searchable: true },
            { data: 'price', name: 'price', className: 'text-center', orderable: true, searchable: false },
            { data: 'is_active', name: 'is_active', className: 'text-center', orderable: true, searchable: false },
            { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-center' }
        ],
        order: [[0, 'asc']],
    });

    document.getElementById('filter_category').addEventListener('change', ()=>table.ajax.reload());
    document.getElementById('filter_active').addEventListener('change', ()=>table.ajax.reload());
});
</script>
@endpush
@endsection


