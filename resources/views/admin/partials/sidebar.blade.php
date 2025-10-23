<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
	<div class="sidebar-brand">
			<a href="{{ route('admin.dashboard') }}" class="brand-link">
				<img src="{{ asset('admin-assets/assets/img/AdminLTELogo.png') }}" alt="Logo" class="brand-image opacity-75 shadow" />
			<span class="brand-text fw-light">Admin</span>
		</a>
	</div>
	<div class="sidebar-wrapper">
		<nav class="mt-2">
			<ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="navigation">
				<li class="nav-item">
					<a href="{{ route('admin.dashboard') }}" class="nav-link">
						<i class="nav-icon bi bi-speedometer"></i>
						<p>Dashboard</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.categories.index') }}" class="nav-link">
						<i class="nav-icon bi bi-diagram-3"></i>
						<p>Categories</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.products.index') }}" class="nav-link">
						<i class="nav-icon bi bi-box"></i>
						<p>Products</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.orders.index') }}" class="nav-link">
						<i class="nav-icon bi bi-cart-check"></i>
						<p>Orders</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.roles.index') }}" class="nav-link">
						<i class="nav-icon bi bi-shield-lock"></i>
						<p>Role & Permission</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.permissions.index') }}" class="nav-link">
						<i class="nav-icon bi bi-key"></i>
						<p>Group Name</p>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</aside>


