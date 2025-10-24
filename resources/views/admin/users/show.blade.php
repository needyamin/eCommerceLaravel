@extends('admin.layouts.app')

@section('content_header')
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0">User #{{ $user->id }}</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('admin.users.index') }}">Users</a></li>
                    <li class="breadcrumb-item active">Show</li>
                </ol>
            </div>
        </div>
    </div>
</div>
@endsection

@section('content')
<div class="row">
    <div class="col-md-6">
            <div class="card">
            <div class="card-header">
                <h3 class="card-title">Profile</h3>
                <div class="card-tools">
                    <a href="{{ route('admin.users.edit', $user) }}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</a>
                </div>
            </div>
            <div class="card-body">
                <dl class="row">
                    <dt class="col-sm-4">Name</dt><dd class="col-sm-8">{{ $user->name }}</dd>
                    <dt class="col-sm-4">Email</dt><dd class="col-sm-8">{{ $user->email ?? '—' }}</dd>
                    <dt class="col-sm-4">Phone</dt><dd class="col-sm-8">{{ $user->phone ?? '—' }}</dd>
                    <dt class="col-sm-4">Joined</dt><dd class="col-sm-8">{{ $user->created_at->format('M d, Y') }}</dd>
                        <dt class="col-sm-4">Coins</dt><dd class="col-sm-8"><span class="badge text-bg-success">{{ $user->coins_balance ?? 0 }}</span></dd>
                </dl>
                <form action="{{ route('admin.users.reset-password', $user) }}" method="POST" class="d-inline">
                    @csrf
                    <button type="submit" class="btn btn-sm btn-secondary" onclick="return confirm('Reset password to \"password\"?')">
                        <i class="fas fa-key"></i> Reset Password
                    </button>
                </form>
                @if($user->email !== 'admin@example.com')
                <form action="{{ route('admin.users.destroy', $user) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this user?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                </form>
                @endif
            </div>
        </div>

            <div class="card">
                <div class="card-header"><h3 class="card-title">Adjust Coins</h3></div>
                <div class="card-body">
                    <form action="{{ route('admin.users.coins.adjust', $user) }}" method="post" class="row g-2">
                        @csrf
                        <div class="col-md-3">
                            <label class="form-label">Amount (+/-)</label>
                            <input type="number" name="amount" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Reason</label>
                            <input type="text" name="reason" class="form-control" placeholder="e.g., bonus, correction">
                        </div>
                        <div class="col-md-3 d-flex align-items-end">
                            <button class="btn btn-primary w-100"><i class="bi bi-coin"></i> Apply</button>
                        </div>
                    </form>
                    <form action="{{ route('admin.users.coins.reset', $user) }}" method="POST" class="mt-2">
                        @csrf
                        <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Reset coins to 0?')">Reset Coins</button>
                    </form>
                </div>
            </div>

        <div class="card">
            <div class="card-header"><h3 class="card-title">Addresses ({{ $user->addresses->count() }})</h3></div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-striped mb-0">
                        <thead><tr><th>Type</th><th>Name</th><th>Address</th><th>Phone</th></tr></thead>
                        <tbody>
                        @forelse($user->addresses as $addr)
                            <tr>
                                <td>{{ ucfirst($addr->type) }} @if($addr->is_default)<span class="badge badge-primary">Default</span>@endif</td>
                                <td>{{ $addr->full_name }}</td>
                                <td>{{ $addr->full_address }}</td>
                                <td>{{ $addr->phone ?? '—' }}</td>
                            </tr>
                        @empty
                            <tr><td colspan="4" class="text-center">No addresses</td></tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card">
            <div class="card-header"><h3 class="card-title">Orders ({{ $user->orders->count() }})</h3></div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead><tr><th>#</th><th>Status</th><th>Total</th><th>Date</th><th></th></tr></thead>
                        <tbody>
                        @forelse($user->orders as $order)
                            <tr>
                                <td>{{ $order->number }}</td>
                                <td><span class="badge badge-{{ $order->status === 'delivered' ? 'success' : ($order->status === 'pending' ? 'warning' : 'secondary') }}">{{ ucfirst($order->status) }}</span></td>
                                <td>@currency($order->grand_total)</td>
                                <td>{{ $order->created_at->format('M d, Y') }}</td>
                                <td><a href="{{ route('admin.orders.show', $order) }}" class="btn btn-xs btn-primary">View</a></td>
                            </tr>
                        @empty
                            <tr><td colspan="5" class="text-center">No orders</td></tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


