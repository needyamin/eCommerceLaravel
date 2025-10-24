@extends('layouts.app')

@section('title', 'My Addresses')

@section('content')
<div class="container py-5">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h1 class="h2 mb-0"><i class="bi bi-geo-alt me-2 text-primary"></i>My Addresses</h1>
        <a href="{{ route('addresses.create') }}" class="btn btn-primary"><i class="bi bi-plus-lg me-1"></i>Add New Address</a>
    </div>

    @if($addresses->count() === 0)
        <div class="alert alert-info d-flex align-items-center" role="alert">
            <i class="bi bi-info-circle me-2"></i>
            <div>
                You haven't added any addresses yet.
                <a href="{{ route('addresses.create') }}" class="ms-2 btn btn-sm btn-primary">Add Your First Address</a>
            </div>
        </div>
    @else
        <div class="row g-4">
            @foreach($addresses as $address)
                <div class="col-md-6 col-lg-4">
                    <div class="card shadow-sm h-100 {{ $address->is_default ? 'border-primary' : '' }}">
                        <div class="card-header bg-white d-flex justify-content-between align-items-center">
                            <h3 class="h6 mb-0">{{ ucfirst($address->type) }} Address</h3>
                            @if($address->is_default)
                                <span class="badge text-bg-primary">Default</span>
                            @endif
                        </div>
                        <div class="card-body">
                            <p class="fw-medium mb-1">{{ $address->full_name }}</p>
                            @if($address->company)
                                <p class="text-muted mb-1">{{ $address->company }}</p>
                            @endif
                            <p class="text-muted mb-1">{{ $address->address_line_1 }}</p>
                            @if($address->address_line_2)
                                <p class="text-muted mb-1">{{ $address->address_line_2 }}</p>
                            @endif
                            <p class="text-muted mb-1">{{ $address->city }}, {{ $address->state }} {{ $address->postal_code }}</p>
                            <p class="text-muted mb-1">{{ $address->country }}</p>
                            @if($address->phone)
                                <p class="text-muted mb-0">{{ $address->phone }}</p>
                            @endif
                        </div>
                        <div class="card-footer bg-light d-flex gap-2">
                            @if(!$address->is_default)
                                <form action="{{ route('addresses.set-default', $address) }}" method="POST" class="d-inline">
                                    @csrf
                                    <button type="submit" class="btn btn-sm btn-outline-primary">
                                        Set Default
                                    </button>
                                </form>
                            @endif
                            <a href="{{ route('addresses.edit', $address) }}" class="btn btn-sm btn-outline-success">Edit</a>
                            <form action="{{ route('addresses.destroy', $address) }}" method="POST" class="d-inline ms-auto" onsubmit="return confirm('Are you sure you want to delete this address?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif
</div>
@endsection
