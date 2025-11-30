@php($p = $p ?? $product ?? null)
<div class="btn-group" role="group">
    <a href="{{ route('admin.products.edit', $p) }}" class="btn btn-sm btn-outline-primary" title="Edit">
        <i class="bi bi-pencil"></i>
    </a>
    <a href="{{ route('admin.products.page-builder', $p) }}" class="btn btn-sm btn-outline-info" title="Page Builder">
        <i class="bi bi-layout-text-window"></i>
    </a>
    <form action="{{ route('admin.products.destroy', $p) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this product?')">
        @csrf
        @method('DELETE')
        <button class="btn btn-sm btn-outline-danger" title="Delete">
            <i class="bi bi-trash"></i>
        </button>
    </form>
</div>

