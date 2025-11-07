@php($p = $p ?? $page ?? null)
<div class="btn-group" role="group">
    <a href="{{ route('admin.pages.edit', $p) }}" class="btn btn-sm btn-outline-primary">Edit</a>
    <form action="{{ route('admin.pages.destroy', $p) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this page?')">
        @csrf
        @method('DELETE')
        <button class="btn btn-sm btn-outline-danger">Delete</button>
    </form>
</div>

