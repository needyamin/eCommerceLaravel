@php($c = $c ?? $coupon ?? null)
<div class="btn-group" role="group">
  <a href="{{ route('admin.coupons.edit', $c->id) }}" class="btn btn-info btn-sm"><i class="bi bi-pencil"></i></a>
  <form action="{{ route('admin.coupons.toggle-status', $c->id) }}" method="POST" class="d-inline">
    @csrf
    <button type="submit" class="btn btn-{{ $c->is_active ? 'warning' : 'success' }} btn-sm">
      <i class="bi bi-{{ $c->is_active ? 'pause' : 'play' }}"></i>
    </button>
  </form>
  <form action="{{ route('admin.coupons.destroy', $c->id) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this coupon?')">
    @csrf
    @method('DELETE')
    <button type="submit" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></button>
  </form>
</div>

