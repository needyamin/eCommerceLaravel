@extends('admin.layouts.app')

@section('title', 'Coupons')

@section('content_header')
    <h1 class="h3 mb-0 text-gray-800">Coupons</h1>
@stop

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">Coupon List</h6>
                    <a href="{{ route('admin.coupons.create') }}" class="btn btn-primary btn-sm">
                        <i class="bi bi-plus me-1"></i>Add New Coupon
                    </a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                            <tbody>
                                @foreach($coupons as $coupon)
                                    <tr>
                                        <td>
                                            <code class="bg-light px-2 py-1 rounded">{{ $coupon->code }}</code>
                                        </td>
                                        <td>{{ $coupon->name }}</td>
                                        <td>
                                            <span class="badge 
                                                @if($coupon->type === 'percentage') badge-info
                                                @else badge-success
                                                @endif">
                                                {{ ucfirst($coupon->type) }}
                                            </span>
                                        </td>
                                        <td>
                                            @if($coupon->type === 'percentage')
                                                {{ $coupon->value }}%
                                            @else
                                                ${{ number_format($coupon->value, 2) }}
                                            @endif
                                        </td>
                                        <td>
                                            {{ $coupon->usages->count() }}
                                            @if($coupon->usage_limit)
                                                / {{ $coupon->usage_limit }}
                                            @endif
                                        </td>
                                        <td>
                                            <span class="badge 
                                                @if($coupon->is_active) badge-success
                                                @else badge-secondary
                                                @endif">
                                                {{ $coupon->is_active ? 'Active' : 'Inactive' }}
                                            </span>
                                        </td>
                                        <td>
                                            @if($coupon->expires_at)
                                                {{ $coupon->expires_at->format('M d, Y') }}
                                            @else
                                                <span class="text-muted">Never</span>
                                            @endif
                                        </td>
                                        <td>
                                            <div class="btn-group" role="group">
                                                <a href="{{ route('admin.coupons.edit', $coupon->id) }}" 
                                                   class="btn btn-info btn-sm">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                                <form action="{{ route('admin.coupons.toggle-status', $coupon->id) }}" 
                                                      method="POST" class="d-inline">
                                                    @csrf
                                                    <button type="submit" 
                                                            class="btn btn-{{ $coupon->is_active ? 'warning' : 'success' }} btn-sm">
                                                        <i class="bi bi-{{ $coupon->is_active ? 'pause' : 'play' }}"></i>
                                                    </button>
                                                </form>
                                                <form action="{{ route('admin.coupons.destroy', $coupon->id) }}" 
                                                      method="POST" class="d-inline"
                                                      onsubmit="return confirm('Are you sure you want to delete this coupon?')">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm">
                                                        <i class="bi bi-trash"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-3">
                        {{ $coupons->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop
