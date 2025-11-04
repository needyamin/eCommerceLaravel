@extends('admin.layouts.app')

@section('title', 'Cart Activity')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-cart-plus me-2"></i>Cart Activity</h1>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-striped align-middle mb-0">
          <thead>
            <tr>
              <th>User</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Product</th>
              <th>Quantity</th>
              <th>Added At</th>
            </tr>
          </thead>
          <tbody>
            @forelse($items as $item)
              <tr>
                <td>
                  @php $user = optional($item->cart->user); @endphp
                  {{ $user->name ?? '—' }}
                  @if(empty($user->email) && empty($user->phone))
                    <span class="badge bg-secondary ms-1">Guest</span>
                  @endif
                </td>
                <td>{{ $user->email ?? '—' }}</td>
                <td>{{ $user->phone ?? '—' }}</td>
                <td>
                  @if($item->product)
                    <a href="{{ route('products.show', $item->product->slug) }}" target="_blank">{{ $item->product->name }}</a>
                  @else
                    <span class="text-muted">(deleted product)</span>
                  @endif
                </td>
                <td>{{ (int) $item->quantity }}</td>
                <td>{{ $item->created_at->format('Y-m-d H:i') }}</td>
              </tr>
            @empty
              <tr>
                <td colspan="5" class="text-center text-muted py-4">No cart activity found.</td>
              </tr>
            @endforelse
          </tbody>
        </table>
      </div>
    </div>
    @if($items->hasPages())
      <div class="card-footer">{{ $items->links() }}</div>
    @endif
  </div>
</div>
@endsection


