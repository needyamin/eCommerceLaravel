@php($r = $r ?? $role ?? null)
<a href="{{ route('admin.roles.edit', $r) }}" class="btn btn-sm btn-link">Edit</a>
<form action="{{ route('admin.roles.destroy', $r) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this role?')">
  @csrf
  @method('DELETE')
  <button class="btn btn-sm btn-link text-danger">Delete</button>
</form>

