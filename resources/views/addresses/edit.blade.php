@extends('layouts.app')

@section('title', 'Edit Address')

@section('content')
<div class="container py-5">
    <div class="mx-auto" style="max-width: 820px;">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h1 class="h2 mb-0"><i class="bi bi-geo-fill me-2 text-primary"></i>Edit Address</h1>
            <a href="{{ route('addresses.index') }}" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left me-1"></i>Back</a>
        </div>

        <div class="card shadow-sm">
            <div class="card-header bg-white">
                <h2 class="h5 mb-0">Address Information</h2>
            </div>
            <div class="card-body">
                <form action="{{ route('addresses.update', $address) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="row g-3">
                        <div class="col-12">
                            <label class="form-label">Address Type</label>
                            <select name="type" required class="form-select @error('type') is-invalid @enderror">
                                <option value="billing" {{ old('type', $address->type) === 'billing' ? 'selected' : '' }}>Billing Address</option>
                                <option value="shipping" {{ old('type', $address->type) === 'shipping' ? 'selected' : '' }}>Shipping Address</option>
                            </select>
                            @error('type')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">First Name</label>
                            <input name="first_name" type="text" required
                                   class="form-control @error('first_name') is-invalid @enderror"
                                   value="{{ old('first_name', $address->first_name) }}">
                            @error('first_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Last Name</label>
                            <input name="last_name" type="text" required
                                   class="form-control @error('last_name') is-invalid @enderror"
                                   value="{{ old('last_name', $address->last_name) }}">
                            @error('last_name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-12">
                            <label class="form-label">Company (Optional)</label>
                            <input name="company" type="text"
                                   class="form-control @error('company') is-invalid @enderror"
                                   value="{{ old('company', $address->company) }}">
                            @error('company')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-12">
                            <label class="form-label">Address Line 1</label>
                            <input name="address_line_1" type="text" required
                                   class="form-control @error('address_line_1') is-invalid @enderror"
                                   value="{{ old('address_line_1', $address->address_line_1) }}">
                            @error('address_line_1')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-12">
                            <label class="form-label">Address Line 2 (Optional)</label>
                            <input name="address_line_2" type="text"
                                   class="form-control @error('address_line_2') is-invalid @enderror"
                                   value="{{ old('address_line_2', $address->address_line_2) }}">
                            @error('address_line_2')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">City</label>
                            <input name="city" type="text" required
                                   class="form-control @error('city') is-invalid @enderror"
                                   value="{{ old('city', $address->city) }}">
                            @error('city')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">State/Province</label>
                            <input name="state" type="text"
                                   class="form-control @error('state') is-invalid @enderror"
                                   value="{{ old('state', $address->state) }}">
                            @error('state')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Postal Code</label>
                            <input name="postal_code" type="text" required
                                   class="form-control @error('postal_code') is-invalid @enderror"
                                   value="{{ old('postal_code', $address->postal_code) }}">
                            @error('postal_code')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-12">
                            <label class="form-label">Country</label>
                            <input name="country" type="text" required
                                   class="form-control @error('country') is-invalid @enderror"
                                   value="{{ old('country', $address->country) }}">
                            @error('country')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-12">
                            <label class="form-label">Phone Number (Optional)</label>
                            <input name="phone" type="tel"
                                   class="form-control @error('phone') is-invalid @enderror"
                                   value="{{ old('phone', $address->phone) }}">
                            @error('phone')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-12 form-check">
                            <input class="form-check-input" type="checkbox" value="1" id="is_default" name="is_default" {{ old('is_default', $address->is_default) ? 'checked' : '' }}>
                            <label class="form-check-label" for="is_default">
                                Set as default {{ old('type', $address->type) }} address
                            </label>
                        </div>
                    </div>

                    <div class="mt-4 d-flex justify-content-end gap-2">
                        <a href="{{ route('addresses.index') }}" class="btn btn-light">Cancel</a>
                        <button type="submit" class="btn btn-primary"><i class="bi bi-save me-1"></i>Update Address</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection


