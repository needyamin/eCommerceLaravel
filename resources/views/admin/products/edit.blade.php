@extends('admin.layouts.app')

@section('title', 'Edit Product')

@section('content')
<div class="card">
    <div class="card-header">
        <h3 class="card-title m-0">Edit Product</h3>
    </div>
    <form action="{{ route('admin.products.update', $product) }}" method="post">
        @csrf
        @method('PUT')
        <div class="card-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Name</label>
                    <input name="name" class="form-control" required value="{{ old('name', $product->name) }}" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Slug</label>
                    <input name="slug" class="form-control" required value="{{ old('slug', $product->slug) }}" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">SKU</label>
                    <input name="sku" class="form-control" value="{{ old('sku', $product->sku) }}" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Category</label>
                    <select name="category_id" class="form-select">
                        <option value="">None</option>
                        @foreach($categories as $id => $name)
                            <option value="{{ $id }}" @selected($product->category_id == $id)>{{ $name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Price</label>
                    <input name="price" type="number" step="0.01" min="0" class="form-control" required value="{{ old('price', $product->price) }}" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Compare at Price</label>
                    <input name="compare_at_price" type="number" step="0.01" min="0" class="form-control" value="{{ old('compare_at_price', $product->compare_at_price) }}" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Stock</label>
                    <input name="stock" type="number" min="0" class="form-control" required value="{{ old('stock', $product->stock) }}" />
                </div>
                <div class="col-12">
                    <label class="form-label">Short Description</label>
                    <textarea name="short_description" rows="2" class="form-control">{{ old('short_description', $product->short_description) }}</textarea>
                </div>
                <div class="col-12">
                    <label class="form-label">Description</label>
                    <textarea name="description" id="product_description" rows="6" class="form-control">{{ old('description', $product->description) }}</textarea>
                </div>
                <div class="col-md-3">
                    <div class="form-check mt-4">
                        <input class="form-check-input" type="checkbox" name="is_active" id="is_active_prod" value="1" @checked($product->is_active) />
                        <label class="form-check-label" for="is_active_prod"> Active </label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-check mt-4">
                        <input class="form-check-input" type="checkbox" name="is_featured" id="is_featured_prod" value="1" @checked($product->is_featured) />
                        <label class="form-check-label" for="is_featured_prod"> Featured </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <button class="btn btn-primary">Save</button>
        </div>
    </form>
</div>

@push('styles')
<!-- Quill Editor CSS -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
    #product_editor {
        height: 400px;
        background: #fff;
    }
    .ql-editor {
        min-height: 400px;
        font-size: 14px;
    }
</style>
@endpush

@push('scripts')
<!-- Quill Editor JS -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Create editor container
    const textarea = document.getElementById('product_description');
    const editorDiv = document.createElement('div');
    editorDiv.id = 'product_editor';
    textarea.parentNode.insertBefore(editorDiv, textarea);
    textarea.style.display = 'none';
    
    // Initialize Quill
    const quill = new Quill('#product_editor', {
        theme: 'snow',
        modules: {
            toolbar: [
                [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                ['bold', 'italic', 'underline', 'strike'],
                [{ 'color': [] }, { 'background': [] }],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                [{ 'align': [] }],
                ['link', 'image', 'video'],
                ['blockquote', 'code-block'],
                ['clean']
            ]
        },
        placeholder: 'Start writing your product description...'
    });
    
    // Set initial content
    @if(old('description', $product->description))
        quill.root.innerHTML = @json(old('description', $product->description));
    @endif
    
    // Update textarea before form submit
    const form = textarea.closest('form');
    form.addEventListener('submit', function() {
        textarea.value = quill.root.innerHTML;
    });
});
</script>
@endpush
@endsection


