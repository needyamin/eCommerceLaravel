@extends('admin.layouts.app')

@section('title', 'Wishlist Activity')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-heart me-2"></i>Wishlist Activity</h1>
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
              <th>Added At</th>
            </tr>
          </thead>
          <tbody>
            @forelse($items as $it)
              <tr>
                <td>
                  @php $user = optional($it->user); @endphp
                  {{ $user->name ?? '—' }}
                  @if(empty($user->email) && empty($user->phone))
                    <span class="badge bg-secondary ms-1">Guest</span>
                  @endif
                </td>
                <td>{{ $user->email ?? '—' }}</td>
                <td>{{ $user->phone ?? '—' }}</td>
                <td>
                  @if($it->product)
                    <a href="{{ route('products.show', $it->product->slug) }}" target="_blank">{{ $it->product->name }}</a>
                  @else
                    <span class="text-muted">(deleted product)</span>
                  @endif
                </td>
                <td>{{ $it->created_at->format('Y-m-d H:i') }}</td>
              </tr>
            @empty
              <tr>
                <td colspan="4" class="text-center text-muted py-4">No wishlist activity found.</td>
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

  <div class="card shadow-sm mt-4">
    <div class="card-header bg-light">
      <h5 class="mb-0"><i class="bi bi-person-x me-2"></i>Guest Wishlist Activity</h5>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-striped align-middle mb-0">
          <thead>
            <tr>
              <th>User</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Product</th>
              <th>Session</th>
              <th>Added At</th>
            </tr>
          </thead>
          <tbody>
            @forelse($guestItems as $g)
              <tr>
                <td><span class="badge bg-secondary">Guest</span></td>
                <td><span class="badge bg-secondary">Guest</span></td>
                <td><span class="badge bg-secondary">Guest</span></td>
                <td>
                  @if($g->product)
                    <a href="{{ route('products.show', $g->product->slug) }}" target="_blank">{{ $g->product->name }}</a>
                  @else
                    <span class="text-muted">(deleted product)</span>
                  @endif
                </td>
                <td class="small text-muted">{{ $g->session_id }}</td>
                <td>{{ $g->created_at->format('Y-m-d H:i') }}</td>
              </tr>
            @empty
              <tr>
                <td colspan="6" class="text-center text-muted py-4">No guest wishlist activity found.</td>
              </tr>
            @endforelse
          </tbody>
        </table>
      </div>
    </div>
    @if($guestItems->hasPages())
      <div class="card-footer">{{ $guestItems->links() }}</div>
    @endif
  </div>
</div>
@endsection


