@extends('layouts.app')

@section('title', 'My Profile')

@section('content')
<div class="container py-5">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h1 class="h2 mb-0"><i class="bi bi-person-circle me-2 text-primary"></i>My Profile</h1>
        <a href="{{ route('orders.index') }}" class="btn btn-outline-primary btn-sm"><i class="bi bi-receipt-cutoff me-1"></i>My Orders</a>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white">
                    <h2 class="h5 mb-0"><i class="bi bi-person-lines-fill me-2"></i>Profile Information</h2>
                </div>
                <div class="card-body">
                    <form action="{{ route('profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Full Name</label>
                                <input name="name" type="text" required
                                       class="form-control @error('name') is-invalid @enderror"
                                       value="{{ old('name', $user->name) }}">
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email Address (optional)</label>
                                <input name="email" type="email"
                                       class="form-control @error('email') is-invalid @enderror"
                                       value="{{ old('email', $user->email) }}">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-12">
                                <label class="form-label">Phone Number (optional)</label>
                                <input name="phone" type="tel"
                                       class="form-control @error('phone') is-invalid @enderror"
                                       value="{{ old('phone', $user->phone) }}">
                                @error('phone')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="mt-4 d-flex gap-2">
                            <button type="submit" class="btn btn-primary"><i class="bi bi-save me-1"></i>Update Profile</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-white">
                    <h2 class="h5 mb-0"><i class="bi bi-shield-lock me-2"></i>Change Password</h2>
                </div>
                <div class="card-body">
                    <form action="{{ route('profile.change-password') }}" method="POST">
                        @csrf
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Current Password</label>
                                <input name="current_password" type="password" required
                                       class="form-control @error('current_password') is-invalid @enderror">
                                @error('current_password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">New Password</label>
                                <input name="password" type="password" required
                                       class="form-control @error('password') is-invalid @enderror">
                                @error('password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Confirm New Password</label>
                                <input name="password_confirmation" type="password" required class="form-control">
                            </div>
                        </div>
                        <div class="mt-4">
                            <button type="submit" class="btn btn-danger"><i class="bi bi-key-fill me-1"></i>Change Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white">
                    <h2 class="h6 mb-0"><i class="bi bi-lightning-charge me-2"></i>Quick Actions</h2>
                </div>
                <div class="card-body d-grid gap-2">
                    <a href="{{ route('orders.index') }}" class="btn btn-outline-primary"><i class="bi bi-receipt me-1"></i>View Orders</a>
                    <a href="{{ route('cart.index') }}" class="btn btn-outline-success"><i class="bi bi-cart3 me-1"></i>View Cart</a>
                    <a href="{{ route('addresses.index') }}" class="btn btn-outline-secondary"><i class="bi bi-geo-alt me-1"></i>Manage Addresses</a>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-white">
                    <h2 class="h6 mb-0"><i class="bi bi-bar-chart-line me-2"></i>Account Stats</h2>
                </div>
                <div class="list-group list-group-flush">
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <span>Total Orders</span>
                        <span class="badge text-bg-primary rounded-pill">{{ $user->orders->count() }}</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <span>Saved Addresses</span>
                        <span class="badge text-bg-secondary rounded-pill">{{ $user->addresses->count() }}</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <span>Member Since</span>
                        <span class="fw-medium">{{ $user->created_at->format('M Y') }}</span>
                    </div>
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <span>Coins</span>
                        <span class="badge text-bg-success rounded-pill">{{ isset($coinsBalance) ? $coinsBalance : ($user->coins_balance ?? 0) }}</span>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm mt-4">
                <div class="card-header bg-white d-flex justify-content-between align-items-center">
                    <h2 class="h6 mb-0"><i class="bi bi-people me-2"></i>Refer & Earn</h2>
                    @php($refCode = $user->referral_code ?? '')
                </div>
                <div class="card-body">
                    <p class="text-muted small mb-2">Share your referral link with friends. When they sign up, you earn bonus coins.</p>
                    <div class="input-group">
                        <input type="text" readonly class="form-control" value="{{ url('/r/' . ($user->referral_code ?? '')) }}">
                        <button class="btn btn-outline-secondary" type="button" onclick="navigator.clipboard.writeText('{{ url('/r/' . ($user->referral_code ?? '')) }}'); this.innerText='Copied!'; setTimeout(()=>this.innerText='Copy',1500);">Copy</button>
                    </div>
                    @if(empty($user->referral_code))
                        <div class="text-danger small mt-2">Referral code will be generated after your next login.</div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
console.log('Coins balance:', {{ isset($coinsBalance)?$coinsBalance:($user->coins_balance ?? 0) }});
</script>
@endpush
