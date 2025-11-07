@php($s = $s ?? $subscriber ?? null)
<form action="{{ route('admin.newsletter.toggle', $s) }}" method="POST" class="d-inline">
  @csrf
  <button class="btn btn-sm btn-outline-warning" type="submit">
    <i class="bi bi-toggle2-on"></i>
  </button>
  </form>
  <form action="{{ route('admin.newsletter.destroy', $s) }}" method="POST" class="d-inline" onsubmit="return confirm('Remove subscriber?')">
    @csrf
    @method('DELETE')
    <button class="btn btn-sm btn-outline-danger" type="submit">
      <i class="bi bi-trash"></i>
    </button>
  </form>

