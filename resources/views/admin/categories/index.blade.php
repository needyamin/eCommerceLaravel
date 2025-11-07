@extends('admin.layouts.app')

@section('title', 'Categories')

@section('content')
<div class="card">
    <div class="card-header d-flex flex-wrap gap-2 justify-content-between align-items-center">
        <h3 class="card-title m-0">Categories</h3>
        <div class="d-flex gap-2 align-items-center ms-auto">
            <select id="filter_cat_active" class="form-select form-select-sm" style="min-width: 140px;">
                <option value="">All Status</option>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>
            <a href="{{ route('admin.categories.create') }}" class="btn btn-primary btn-sm">New Category</a>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table id="categoriesTable" class="table table-striped mb-0 align-middle" style="width:100%">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Slug</th>
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
    const table = $('#categoriesTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: {
            url: '{{ route('admin.datatables', 'categories') }}',
            data: function(d){
                d.is_active = document.getElementById('filter_cat_active').value || '';
            }
        },
        columns: [
            { data: 'name', name: 'name' },
            { data: 'slug', name: 'slug', className: 'text-center' },
            { data: 'is_active', name: 'is_active', className: 'text-center', orderable: true, searchable: false },
            { data: 'actions', name: 'actions', orderable: false, searchable: false, className: 'text-center' },
        ],
        order: [[0, 'asc']],
    });
    document.getElementById('filter_cat_active').addEventListener('change', ()=>table.ajax.reload());
});
</script>
@endpush
@endsection


