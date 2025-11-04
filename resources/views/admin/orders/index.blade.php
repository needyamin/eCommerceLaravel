@extends('admin.layouts.app')

@section('content_header')
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">Orders</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                    <li class="breadcrumb-item active">Orders</li>
                </ol>
            </div>
        </div>
    </div>
</div>
@endsection

@section('content')
<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title mb-0">All Orders</h3>
        <a href="{{ route('admin.orders.create') }}" class="btn btn-sm btn-primary">
            <i class="bi bi-bag-plus me-1"></i> Create Order
        </a>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
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
                <tbody>
                    @forelse($orders as $order)
                        <tr>
                            <td>{{ $order->number }}</td>
                            <td>
                                @if($order->user)
                                    {{ $order->user->name }}<br>
                                    <small class="text-muted">{{ $order->user->email }}</small>
                                @else
                                    <span class="text-muted">Guest</span>
                                @endif
                            </td>
                            <td>
                                @php
                                    $statusClass = match($order->status){
                                        'pending' => 'warning',
                                        'processing' => 'info',
                                        'cancelled' => 'danger',
                                        'delivered' => 'success',
                                        default => 'secondary'
                                    };
                                @endphp
                                <span class="badge text-bg-{{ $statusClass }}">
                                    {{ ucfirst($order->status) }}
                                </span>
                            </td>
                            <td>
                                @php
                                    $payClass = $order->payment_status === 'paid' ? 'success' : ($order->payment_status === 'refunded' ? 'secondary' : 'warning');
                                @endphp
                                <span class="badge text-bg-{{ $payClass }}">
                                    {{ ucfirst($order->payment_status) }}
                                </span>
                            </td>
                            <td>
                                @php
                                    $shipClass = match($order->shipping_status){
                                        'unshipped' => 'secondary',
                                        'shipped' => 'info',
                                        'delivered' => 'success',
                                        'returned' => 'danger',
                                        default => 'warning'
                                    };
                                @endphp
                                <span class="badge text-bg-{{ $shipClass }}">
                                    {{ ucfirst($order->shipping_status) }}
                                </span>
                            </td>
                            <td>${{ number_format($order->grand_total, 2) }}</td>
                            <td>{{ $order->created_at->format('M d, Y') }}</td>
                            <td>
                                <a href="{{ route('admin.orders.show', $order) }}" class="btn btn-sm btn-primary">
                                    <i class="fas fa-eye"></i> View
                                </a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="8" class="text-center">No orders found</td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    <div class="card-footer">
        {{ $orders->links() }}
    </div>
</div>
@endsection
