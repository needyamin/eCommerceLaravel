@php($c = $c ?? $currency ?? null)
<div class="btn-group">
  <a href="{{ route('admin.currencies.edit', $c) }}" class="btn btn-sm btn-info"><i class="bi bi-pencil"></i></a>
  <form action="{{ route('admin.currencies.toggle', $c) }}" method="POST" class="d-inline">
    @csrf
    <button class="btn btn-sm btn-{{ $c->is_active ? 'warning' : 'success' }}" type="submit">
      <i class="bi bi-{{ $c->is_active ? 'pause' : 'play' }}"></i>
    </button>
  </form>
  @if(!$c->is_default)
  <form action="{{ route('admin.currencies.default', $c) }}" method="POST" class="d-inline">
    @csrf
    <button class="btn btn-sm btn-outline-primary" type="submit">Set Default</button>
  </form>
  @endif
  <form action="{{ route('admin.currencies.destroy', $c) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this currency?')">
    @csrf
    @method('DELETE')
    <button class="btn btn-sm btn-danger" type="submit"><i class="bi bi-trash"></i></button>
  </form>
</div>

