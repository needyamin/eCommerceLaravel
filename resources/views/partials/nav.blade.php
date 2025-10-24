<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand text-primary fw-bold" href="{{ route('home') }}">
            <i class="bi bi-shop me-2"></i>{{ $siteSettings->site_name ?? 'eCommerce Store' }}
        </a>

        <!-- Mobile Toggle -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- Search Bar -->
            <form action="{{ route('products.index') }}" method="get" class="d-flex flex-grow-1 mx-3">
                <div class="input-group">
                    <input name="q" value="{{ request('q') }}" 
                           class="form-control search-box" 
                           placeholder="Search products..." 
                           aria-label="Search products">
                    <button class="btn btn-primary" type="submit">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
            </form>

            <!-- Navigation Links -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="{{ route('home') }}">
                        <i class="bi bi-house me-1"></i>Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold" href="{{ route('products.index') }}">
                        <i class="bi bi-grid me-1"></i>Products
                    </a>
                </li>
                    <li class="nav-item">
                        <a class="nav-link fw-semibold position-relative" href="{{ route('cart.index') }}">
                        <i class="bi bi-cart me-1"></i>Cart
                            @php
                                $cartCount = 0;
                                if (auth()->check()) {
                                    $cart = auth()->user()->carts()->whereHas('items')->first();
                                    $cartCount = $cart ? $cart->items->sum('quantity') : 0;
                                } else {
                                    $sessionId = session('cart_session_id');
                                    if ($sessionId) {
                                        $cart = \App\Models\Cart::where('session_id', $sessionId)->with('items')->first();
                                        $cartCount = $cart ? $cart->items->sum('quantity') : 0;
                                    }
                                }
                            @endphp
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger cart-count-badge {{ $cartCount > 0 ? '' : 'd-none' }}">
                                {{ $cartCount > 0 ? $cartCount : '' }}
                                <span class="visually-hidden">items in cart</span>
                            </span>
                    </a>
                </li>
            </ul>

				<!-- Currency Switcher removed from frontend navigation -->

                <!-- User Menu -->
                <ul class="navbar-nav">
                @auth
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle me-2 fs-5"></i>
                            <span class="fw-semibold">{{ Auth::user()->name }}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <a class="dropdown-item" href="{{ route('profile') }}">
                                    <i class="bi bi-person me-2"></i>Profile
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('orders.index') }}">
                                    <i class="bi bi-bag me-2"></i>My Orders
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="{{ route('addresses.index') }}">
                                    <i class="bi bi-geo-alt me-2"></i>Addresses
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="{{ route('logout') }}" method="POST" class="d-inline">
                                    @csrf
                                    <button type="submit" class="dropdown-item text-danger">
                                        <i class="bi bi-box-arrow-right me-2"></i>Logout
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </li>
                @else
                    <li class="nav-item">
                        <a class="nav-link fw-semibold" href="{{ route('login') }}">
                            <i class="bi bi-box-arrow-in-right me-1"></i>Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary btn-custom ms-2" href="{{ route('register') }}">
                            <i class="bi bi-person-plus me-1"></i>Register
                        </a>
                    </li>
                @endauth
            </ul>
        </div>
    </div>
</nav>
    <script>
    document.addEventListener('DOMContentLoaded', function(){
        function updateCartCount(count){
            const badge = document.querySelector('.cart-count-badge');
            if(!badge){ return; }
            if(count > 0){
                badge.textContent = count;
                badge.classList.remove('d-none');
            } else {
                badge.textContent = '';
                badge.classList.add('d-none');
            }
        }
        window.__updateCartCount = updateCartCount;
    });
    </script>


