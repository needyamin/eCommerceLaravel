<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', $siteSettings->meta_title ?? ($siteSettings->site_name ?? 'eCommerce Store'))</title>
    @if(!empty($siteSettings->meta_description))
    <meta name="description" content="{{ $siteSettings->meta_description }}">
    @endif
    @if(!empty($siteSettings->meta_keywords))
    <meta name="keywords" content="{{ $siteSettings->meta_keywords }}">
    @endif
    @if(!empty($siteSettings->logo_url))
    <meta property="og:image" content="{{ $siteSettings->logo_url }}">
    @endif
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    @if(!empty($siteSettings->favicon_url))
    <link rel="icon" href="{{ $siteSettings->favicon_url }}" />
    @endif
    <!-- Custom CSS -->
    <style>
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        .footer {
            background-color: #2c3e50;
            color: white;
        }
        .btn-custom {
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 500;
        }
        .search-box {
            border-radius: 25px;
            border: 2px solid #e9ecef;
        }
        .search-box:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    @include('partials.nav')
    
    <main class="flex-grow-1">
        <div class="container">
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show m-3" role="alert">
                <i class="bi bi-check-circle me-2"></i>{{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif
        
        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show m-3" role="alert">
                <i class="bi bi-exclamation-triangle me-2"></i>{{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif
        </div>

        @yield('content')
    </main>
    
    @include('partials.footer')
    
    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    (function(){
        if(window.__wishlistListenerBound) return; // avoid duplicates
        window.__wishlistListenerBound = true;
        document.addEventListener('click', function(e){
            const btn = e.target.closest('.wishlist-toggle');
            if(!btn) return;
            e.preventDefault();
            const pid = btn.getAttribute('data-product-id');
            fetch("{{ route('wishlist.toggle') }}", {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                credentials: 'same-origin',
                body: JSON.stringify({ product_id: pid })
            }).then(async r=>{
                let res = null;
                try { res = await r.json(); } catch(e) {}
                if(!r.ok) throw new Error('Request failed');
                return res;
            }).then(res=>{
                if(!res || !res.success) return;
                const icon = btn.querySelector('i');
                const label = btn.querySelector('span');
                if(res.state === 'added'){
                    icon && icon.classList.remove('bi-heart');
                    icon && icon.classList.add('bi-heart-fill');
                    btn.classList.remove('btn-outline-danger');
                    btn.classList.add('btn-danger');
                    if(label){ label.textContent = 'Wishlisted'; }
                } else {
                    icon && icon.classList.remove('bi-heart-fill');
                    icon && icon.classList.add('bi-heart');
                    btn.classList.add('btn-outline-danger');
                    btn.classList.remove('btn-danger');
                    if(label){ label.textContent = 'Add to Wishlist'; }
                }
                if(typeof window.__updateWishlistCount === 'function' && typeof res.count !== 'undefined'){
                    window.__updateWishlistCount(res.count);
                }
            }).catch(()=>{});
        });
    })();
    (function(){
        if(window.__cartRemoveListenerBound) return; // avoid duplicates
        window.__cartRemoveListenerBound = true;
        document.addEventListener('click', function(e){
            const btn = e.target.closest('[data-cart-remove]');
            if(!btn) return;
            e.preventDefault();
            const itemId = btn.getAttribute('data-cart-remove');
            const pid = btn.getAttribute('data-product-id');
            const stock = parseInt(btn.getAttribute('data-stock') || '0', 10);
            const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            fetch(`${window.location.origin}/cart/items/${itemId}`, {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'Accept': 'application/json',
                    'X-CSRF-TOKEN': token
                },
                body: new URLSearchParams({ _method: 'DELETE' })
            }).then(r=>r.json()).then(res=>{
                if(!res || !res.success) return;
                if(typeof window.__updateCartCount === 'function'){
                    window.__updateCartCount(res.cart.count);
                }
                const alertBox = btn.closest('.alert.alert-success');
                if(alertBox){
                    const container = alertBox.closest('.card-body') || alertBox.parentNode;
                    container && container.querySelectorAll('.js-view-cart-btn').forEach(n=>n.remove());
                    const wrapper = document.createElement('div');
                    wrapper.innerHTML = `
                        <form action="{{ route('cart.add') }}" method="post" onsubmit="return addToCartAjax(event, this)">
                            <input type="hidden" name="_token" value="${token}">
                            <input type="hidden" name="product_id" value="${pid}">
                            <button class="btn btn-primary w-100 btn-custom" ${stock <= 0 ? 'disabled' : ''}>
                                <i class="bi bi-cart-plus me-2"></i>
                                ${stock <= 0 ? 'Out of Stock' : 'Add to Cart'}
                            </button>
                        </form>`;
                    const formNode = wrapper.firstElementChild;
                    alertBox.parentNode.replaceChild(formNode, alertBox);
                }
            }).catch(()=>{});
        });
    })();
    </script>
    @stack('scripts')
</body>
</html>


