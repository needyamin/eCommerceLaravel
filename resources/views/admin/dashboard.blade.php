@extends('admin.layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
  <h1 class="h3 mb-0 fw-semibold"><i class="bi bi-speedometer2 me-2 text-primary"></i>Dashboard</h1>
</div>

<div class="row g-4">
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Orders</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['orders'] }}</div>
        </div>
        <div class="text-primary"><i class="bi bi-bag fs-1"></i></div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Products</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['products'] }}</div>
        </div>
        <div class="text-success"><i class="bi bi-box-seam fs-1"></i></div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Categories</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['categories'] }}</div>
        </div>
        <div class="text-warning"><i class="bi bi-diagram-3 fs-1"></i></div>
      </div>
    </div>
  </div>
</div>
@endsection


