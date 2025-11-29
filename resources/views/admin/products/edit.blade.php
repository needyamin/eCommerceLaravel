@extends('admin.layouts.app')

@section('title', 'Edit Product')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-bottom">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-pencil-square me-2 fs-5"></i>
                        <h3 class="card-title mb-0 fw-semibold">Edit Product</h3>
                    </div>
                </div>
                <form action="{{ route('admin.products.update', $product) }}" method="post">
                    @csrf
                    @method('PUT')
                    <div class="card-body p-4">
                        <!-- Basic Information Section -->
                        <div class="form-section mb-4">
                            <div class="section-header mb-3">
                                <h5 class="mb-0 fw-semibold text-primary">
                                    <i class="bi bi-info-circle me-2"></i>Basic Information
                                </h5>
                                <hr class="mt-2 mb-0">
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-tag me-1 text-muted"></i>Product Name <span class="text-danger">*</span>
                                    </label>
                                    <input name="name" id="product_name" class="form-control form-control-lg" required value="{{ old('name', $product->name) }}" placeholder="Enter product name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-link-45deg me-1 text-muted"></i>Slug <span class="text-danger">*</span>
                                    </label>
                                    <input name="slug" id="product_slug" class="form-control form-control-lg" required value="{{ old('slug', $product->slug) }}" placeholder="product-slug" />
                                    <div id="slug_error" class="text-danger small mt-1 fw-semibold" style="display: none;"></div>
                                    <div id="slug_success" class="text-success small mt-1 fw-semibold" style="display: none;"></div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-upc-scan me-1 text-muted"></i>SKU
                                    </label>
                                    <input name="sku" class="form-control form-control-lg" value="{{ old('sku', $product->sku) }}" placeholder="Product SKU (optional)" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-folder me-1 text-muted"></i>Category
                                    </label>
                                    <select name="category_id" id="category_id" class="form-select form-select-lg">
                                        <option value="">Select Category (Optional)</option>
                                        @foreach($parentCategories as $id => $name)
                                            @php
                                                $selectedCategory = $product->category;
                                                $isParentSelected = $selectedCategory && $selectedCategory->parent_id == $id;
                                                $isDirectSelected = $product->category_id == $id && (!$selectedCategory || !$selectedCategory->parent_id);
                                            @endphp
                                            <option value="{{ $id }}" @selected($isParentSelected || $isDirectSelected)>{{ $name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-folder2-open me-1 text-muted"></i>Subcategory
                                    </label>
                                    <select name="subcategory_id" id="subcategory_id" class="form-select form-select-lg" @if(!$subcategories || count($subcategories) == 0) disabled @endif>
                                        <option value="">Select Subcategory (Optional)</option>
                                        @if(isset($subcategories) && count($subcategories) > 0)
                                            @foreach($subcategories as $id => $name)
                                                <option value="{{ $id }}" @selected($product->category_id == $id)>{{ $name }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <small class="text-muted">Select a category first to see subcategories</small>
                                </div>
                            </div>
                        </div>

                        <!-- Pricing & Inventory Section -->
                        <div class="form-section mb-4">
                            <div class="section-header mb-3">
                                <h5 class="mb-0 fw-semibold text-primary">
                                    <i class="bi bi-currency-dollar me-2"></i>Pricing & Inventory
                                </h5>
                                <hr class="mt-2 mb-0">
                            </div>
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-cash-stack me-1 text-muted"></i>Price <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light">৳</span>
                                        <input name="price" type="number" step="0.01" min="0" class="form-control" required value="{{ old('price', $product->price) }}" placeholder="0.00" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-tag me-1 text-muted"></i>Compare at Price
                                    </label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light">৳</span>
                                        <input name="compare_at_price" type="number" step="0.01" min="0" class="form-control" value="{{ old('compare_at_price', $product->compare_at_price) }}" placeholder="0.00" />
                                    </div>
                                    <small class="text-muted">Original price for showing discounts</small>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-box-seam me-1 text-muted"></i>Stock Quantity <span class="text-danger">*</span>
                                    </label>
                                    <input name="stock" type="number" min="0" class="form-control form-control-lg" required value="{{ old('stock', $product->stock) }}" placeholder="0" />
                                </div>
                            </div>
                        </div>

                        <!-- Description Section -->
                        <div class="form-section mb-4">
                            <div class="section-header mb-3">
                                <h5 class="mb-0 fw-semibold text-primary">
                                    <i class="bi bi-file-text me-2"></i>Description
                                </h5>
                                <hr class="mt-2 mb-0">
                            </div>
                            <div class="row g-3">
                                <div class="col-12">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-card-text me-1 text-muted"></i>Short Description
                                    </label>
                                    <textarea name="short_description" rows="3" class="form-control" placeholder="Brief description that appears in product listings...">{{ old('short_description', $product->short_description) }}</textarea>
                                    <small class="text-muted">This will be shown in product cards and search results</small>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-semibold">
                                        <i class="bi bi-file-earmark-text me-1 text-muted"></i>Full Description
                                    </label>
                                    <textarea name="description" id="product_description" rows="6" class="form-control" placeholder="Detailed product description...">{{ old('description', $product->description) }}</textarea>
                                    <small class="text-muted">Rich text editor - format your content with headings, lists, links, and more</small>
                                </div>
                            </div>
                        </div>

                        <!-- Status & Options Section -->
                        <div class="form-section mb-4">
                            <div class="section-header mb-3">
                                <h5 class="mb-0 fw-semibold text-primary">
                                    <i class="bi bi-toggle-on me-2"></i>Status & Options
                                </h5>
                                <hr class="mt-2 mb-0">
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="form-check form-switch form-switch-lg p-3 border rounded bg-light">
                                        <input class="form-check-input" type="checkbox" name="is_active" id="is_active_prod" value="1" @checked($product->is_active) />
                                        <label class="form-check-label fw-semibold ms-2" for="is_active_prod">
                                            <i class="bi bi-check-circle me-1 text-success"></i>Active Product
                                        </label>
                                        <small class="d-block text-muted ms-5 mt-1">Product will be visible to customers</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-check form-switch form-switch-lg p-3 border rounded bg-light">
                                        <input class="form-check-input" type="checkbox" name="is_featured" id="is_featured_prod" value="1" @checked($product->is_featured) />
                                        <label class="form-check-label fw-semibold ms-2" for="is_featured_prod">
                                            <i class="bi bi-star me-1 text-warning"></i>Featured Product
                                        </label>
                                        <small class="d-block text-muted ms-5 mt-1">Show on homepage featured section</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer bg-light border-top py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <a href="{{ route('admin.products.index') }}" class="btn btn-outline-secondary">
                                <i class="bi bi-arrow-left me-1"></i>Cancel
                            </a>
                            <button type="submit" class="btn btn-primary btn-lg px-4" id="submit_btn">
                                <i class="bi bi-check-circle me-2"></i>Save Changes
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@push('styles')
<!-- Quill Editor CSS -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
    
    .form-section {
        background: #f8f9fa;
        padding: 1.5rem;
        border-radius: 0.5rem;
        border: 1px solid #e9ecef;
    }
    
    .section-header h5 {
        color: #667eea;
        font-size: 1.1rem;
    }
    
    .section-header hr {
        border: 0;
        height: 2px;
        background: linear-gradient(90deg, #667eea 0%, transparent 100%);
        opacity: 0.3;
    }
    
    .form-label {
        color: #495057;
        margin-bottom: 0.5rem;
        font-size: 0.95rem;
    }
    
    .form-control, .form-select {
        border: 1px solid #dee2e6;
        transition: all 0.3s ease;
    }
    
    .form-control:focus, .form-select:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    }
    
    .form-control-lg, .form-select-lg {
        padding: 0.75rem 1rem;
        font-size: 1rem;
    }
    
    .input-group-text {
        border-color: #dee2e6;
        color: #6c757d;
        font-weight: 600;
    }
    
    .form-check-switch-lg {
        font-size: 1.1rem;
    }
    
    .form-check-switch-lg .form-check-input {
        width: 3rem;
        height: 1.5rem;
    }
    
    .form-check-switch-lg .form-check-label {
        font-size: 1rem;
    }
    
    #product_editor {
        height: 400px;
        background: #fff;
        border-radius: 0.375rem;
        border: 1px solid #dee2e6;
    }
    
    .ql-editor {
        min-height: 400px;
        font-size: 14px;
    }
    
    .ql-toolbar {
        border-top-left-radius: 0.375rem;
        border-top-right-radius: 0.375rem;
        border-bottom: 1px solid #dee2e6;
    }
    
    .ql-container {
        border-bottom-left-radius: 0.375rem;
        border-bottom-right-radius: 0.375rem;
    }
    
    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        transition: all 0.3s ease;
    }
    
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }
    
    .btn-outline-secondary {
        transition: all 0.3s ease;
    }
    
    .btn-outline-secondary:hover {
        transform: translateY(-2px);
    }
    
    .card {
        border-radius: 0.75rem;
        overflow: hidden;
    }
    
    .card-header {
        border-radius: 0 !important;
    }
    
    .is-invalid {
        border-color: #dc3545 !important;
    }
    
    .is-valid {
        border-color: #28a745 !important;
    }
    
    .form-check {
        transition: all 0.3s ease;
    }
    
    .form-check:hover {
        transform: translateX(5px);
    }
    
    .form-check-input:checked {
        background-color: #667eea;
        border-color: #667eea;
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
    const productId = {{ $product->id }};
    
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
                    product_id: productId
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
    
    // Check initial slug on page load
    @if(old('slug', $product->slug))
        checkSlugAvailability('{{ old("slug", $product->slug) }}');
    @endif
});
</script>
@endpush
@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const categorySelect = document.getElementById('category_id');
    const subcategorySelect = document.getElementById('subcategory_id');
    
    categorySelect.addEventListener('change', function() {
        const categoryId = this.value;
        
        // Clear subcategory dropdown
        subcategorySelect.innerHTML = '<option value="">Select Subcategory (Optional)</option>';
        subcategorySelect.disabled = true;
        
        if (categoryId) {
            // Fetch subcategories for selected category
            fetch(`/admin/api/categories/${categoryId}/subcategories`)
                .then(response => response.json())
                .then(data => {
                    if (data.subcategories && data.subcategories.length > 0) {
                        data.subcategories.forEach(sub => {
                            const option = document.createElement('option');
                            option.value = sub.id;
                            option.textContent = sub.name;
                            @if($product->category_id)
                                if (sub.id == {{ $product->category_id }}) {
                                    option.selected = true;
                                }
                            @endif
                            subcategorySelect.appendChild(option);
                        });
                        subcategorySelect.disabled = false;
                    } else {
                        subcategorySelect.innerHTML = '<option value="">No subcategories available</option>';
                    }
                })
                .catch(error => {
                    console.error('Error fetching subcategories:', error);
                    subcategorySelect.innerHTML = '<option value="">Error loading subcategories</option>';
                });
        }
    });
    
    // Trigger change event on page load if category is already selected
    if (categorySelect.value) {
        categorySelect.dispatchEvent(new Event('change'));
    }
    
    // Handle form submission - use subcategory if selected, otherwise use category
    const form = document.querySelector('form');
    form.addEventListener('submit', function(e) {
        const subcategoryId = subcategorySelect.value;
        const categoryId = categorySelect.value;
        
        // If subcategory is selected, use it; otherwise use the parent category
        if (subcategoryId) {
            // Create a hidden input to override category_id with subcategory_id
            const hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = 'category_id';
            hiddenInput.value = subcategoryId;
            form.appendChild(hiddenInput);
            // Disable the original category select
            categorySelect.disabled = true;
        }
    });
});
</script>
@endpush
@endsection
