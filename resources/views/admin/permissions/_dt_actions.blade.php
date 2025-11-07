@php($p = $p ?? $permission ?? null)
<a href="{{ route('admin.permissions.edit', $p) }}" class="btn btn-sm btn-link">Edit</a>
<form action="{{ route('admin.permissions.destroy', $p) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this permission?')">
  @csrf
  @method('DELETE')
  <button class="btn btn-sm btn-link text-danger">Delete</button>
</form>

