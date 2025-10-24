@extends('admin.layouts.app')

@section('title', 'Edit Currency')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0">Edit Currency</h1>
    <a href="{{ route('admin.currencies.index') }}" class="btn btn-secondary"><i class="bi bi-arrow-left me-1"></i>Back</a>
  </div>

  <div class="card shadow-sm">
    <div class="card-body">
      <form action="{{ route('admin.currencies.update', $currency) }}" method="POST">
        @csrf
        @method('PUT')
        @include('admin.currencies.partials.form', ['currency' => $currency])
        <div class="mt-3">
          <button class="btn btn-primary" type="submit"><i class="bi bi-save me-1"></i>Update</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection
