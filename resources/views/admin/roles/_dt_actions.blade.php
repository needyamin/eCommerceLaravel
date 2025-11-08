@php($r = $r ?? $role ?? null)
<div class="d-flex gap-2">
	<a href="{{ route('admin.roles.edit', $r) }}" class="btn btn-sm btn-link">Edit</a>
	<a href="{{ route('admin.roles.copy', $r) }}" class="btn btn-sm btn-link text-info" title="Copy Role">
		<i class="bi bi-copy me-1"></i>Copy
	</a>
	<form action="{{ route('admin.roles.destroy', $r) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this role?')">
		@csrf
		@method('DELETE')
		<button class="btn btn-sm btn-link text-danger">Delete</button>
	</form>
</div>

