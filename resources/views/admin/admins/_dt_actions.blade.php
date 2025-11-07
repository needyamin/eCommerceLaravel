@php($a = $a ?? $admin ?? null)
<a href="{{ route('admin.admins.edit', $a) }}" class="btn btn-sm btn-outline-primary">Edit</a>
@if($a->email !== 'admin@example.com')
  <form action="{{ route('admin.admins.destroy', $a) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this admin?')">
    @csrf @method('DELETE')
    <button class="btn btn-sm btn-outline-danger">Delete</button>
  </form>
@endif

