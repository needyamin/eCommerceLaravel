@php($c = $c ?? $category ?? null)
<div class="btn-group" role="group">
    <a href="{{ route('admin.categories.edit', $c) }}" class="btn btn-sm btn-outline-primary">Edit</a>
    <form action="{{ route('admin.categories.destroy', $c) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this category?')">
        @csrf
        @method('DELETE')
        <button class="btn btn-sm btn-outline-danger">Delete</button>
    </form>
</div>

