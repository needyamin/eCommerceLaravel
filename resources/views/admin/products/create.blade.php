@extends('admin.layouts.app')

@section('title', 'New Product')

@section('content')
<div class="card">
    <div class="card-header">
        <h3 class="card-title m-0">New Product</h3>
    </div>
    <form action="{{ route('admin.products.store') }}" method="post">
        @csrf
        <div class="card-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Name</label>
                    <input name="name" id="product_name" class="form-control" required />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Slug</label>
                    <input name="slug" id="product_slug" class="form-control" required />
                    <div id="slug_error" class="text-danger small mt-1 fw-semibold" style="display: none;"></div>
                    <div id="slug_success" class="text-success small mt-1 fw-semibold" style="display: none;"></div>
                </div>
                <div class="col-md-6">
                    <label class="form-label">SKU</label>
                    <input name="sku" class="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Category</label>
                    <select name="category_id" class="form-select">
                        <option value="">None</option>
                        @foreach($categories as $id => $name)
                            <option value="{{ $id }}">{{ $name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Price</label>
                    <input name="price" type="number" step="0.01" min="0" class="form-control" required />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Compare at Price</label>
                    <input name="compare_at_price" type="number" step="0.01" min="0" class="form-control" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Stock</label>
                    <input name="stock" type="number" min="0" class="form-control" value="0" required />
                </div>
                <div class="col-12">
                    <label class="form-label">Short Description</label>
                    <textarea name="short_description" rows="2" class="form-control"></textarea>
                </div>
                <div class="col-12">
                    <label class="form-label">Description</label>
                    <textarea name="description" id="product_description" rows="6" class="form-control"></textarea>
                </div>
                <div class="col-md-3">
                    <div class="form-check mt-4">
                        <input class="form-check-input" type="checkbox" name="is_active" id="is_active" checked />
                        <label class="form-check-label" for="is_active"> Active </label>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-check mt-4">
                        <input class="form-check-input" type="checkbox" name="is_featured" id="is_featured" />
                        <label class="form-check-label" for="is_featured"> Featured </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" class="btn btn-primary" id="submit_btn">Create</button>
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
    @if(old('description'))
        quill.root.innerHTML = @json(old('description'));
    @endif
    
    // Update textarea before form submit
    const form = textarea.closest('form');
    form.addEventListener('submit', function(e) {
        textarea.value = quill.root.innerHTML;
        
        // Prevent submission if slug is duplicate
        if (window.slugDuplicate) {
            e.preventDefault();
            alert('Please fix the slug error before submitting.');
            return false;
        }
    });
    
    // Auto-generate slug from name
    const nameInput = document.getElementById('product_name');
    const slugInput = document.getElementById('product_slug');
    const slugError = document.getElementById('slug_error');
    const slugSuccess = document.getElementById('slug_success');
    const submitBtn = document.getElementById('submit_btn');
    let slugCheckTimeout;
    let slugDuplicate = false;
    window.slugDuplicate = false;
    
    // Function to generate slug from text
    function generateSlug(text) {
        return text
            .toString()
            .toLowerCase()
            .trim()
            .replace(/\s+/g, '-')
            .replace(/[^\w\-]+/g, '')
            .replace(/\-\-+/g, '-')
            .replace(/^-+/, '')
            .replace(/-+$/, '');
    }
    
    // Auto-generate slug when name changes
    let isManualSlugEdit = false;
    nameInput.addEventListener('input', function() {
        if (!isManualSlugEdit) {
            const slug = generateSlug(this.value);
            slugInput.value = slug;
            if (slug) {
                checkSlugAvailability(slug);
            }
        }
    });
    
    // Track manual slug edits
    slugInput.addEventListener('input', function() {
        isManualSlugEdit = true;
        const slug = this.value.trim();
        if (slug) {
            checkSlugAvailability(slug);
        } else {
            hideSlugMessages();
        }
    });
    
    // Check slug availability
    function checkSlugAvailability(slug) {
        if (!slug || slug.trim() === '') {
            hideSlugMessages();
            return;
        }
        
        clearTimeout(slugCheckTimeout);
        slugCheckTimeout = setTimeout(function() {
            // Show loading state
            slugError.style.display = 'none';
            slugSuccess.style.display = 'none';
            
            fetch('{{ route("admin.products.check-slug") }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json'
                },
                body: JSON.stringify({
                    slug: slug.trim(),
                    product_id: null
                })
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Slug check response:', data);
                if (data.available) {
                    slugError.style.display = 'none';
                    slugSuccess.style.display = 'block';
                    slugSuccess.textContent = data.message || 'Slug is available';
                    slugInput.classList.remove('is-invalid');
                    slugInput.classList.add('is-valid');
                    slugDuplicate = false;
                    window.slugDuplicate = false;
                    // Enable submit button
                    if (submitBtn) {
                        submitBtn.disabled = false;
                        submitBtn.classList.remove('disabled');
                    }
                } else {
                    slugSuccess.style.display = 'none';
                    slugError.style.display = 'block';
                    slugError.textContent = data.message || 'This slug is already taken';
                    slugInput.classList.remove('is-valid');
                    slugInput.classList.add('is-invalid');
                    slugDuplicate = true;
                    window.slugDuplicate = true;
                    // Disable submit button
                    if (submitBtn) {
                        submitBtn.disabled = true;
                        submitBtn.classList.add('disabled');
                    }
                }
            })
            .catch(error => {
                console.error('Error checking slug:', error);
                slugError.style.display = 'block';
                slugError.textContent = 'Error checking slug availability. Please try again.';
                slugInput.classList.add('is-invalid');
                // Disable submit button on error
                if (submitBtn) {
                    submitBtn.disabled = true;
                    submitBtn.classList.add('disabled');
                }
            });
        }, 500);
    }
    
    function hideSlugMessages() {
        slugError.style.display = 'none';
        slugSuccess.style.display = 'none';
        slugInput.classList.remove('is-invalid', 'is-valid');
        // Enable submit button when slug is cleared
        if (submitBtn) {
            submitBtn.disabled = false;
            submitBtn.classList.remove('disabled');
        }
    }
});
</script>
@endpush
@endsection


