<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
	<div class="sidebar-brand">
			<a href="{{ route('admin.dashboard') }}" class="brand-link">
				<img src="{{ asset('admin-assets/assets/img/AdminLTELogo.png') }}" alt="Logo" class="brand-image opacity-75 shadow" />
			<span class="brand-text fw-light">Admin</span>
		</a>
	</div>
	<div class="sidebar-wrapper">
		<style>
			/* Keep items visually the same; only indent sub-items */
			.app-sidebar .nav-treeview .nav-link { padding-left: 2.25rem; }
		</style>
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
					<a href="{{ route('admin.users.index') }}" class="nav-link">
						<i class="nav-icon bi bi-people"></i>
						<p>Users</p>
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
						<p>Route Permissions</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon bi bi-gear"></i>
						<p>Settings <i class="nav-arrow bi bi-chevron-right"></i></p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="{{ route('admin.site-settings.index') }}" class="nav-link">
								<i class="nav-icon bi bi-gear"></i>
								<p>Site Settings</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.email-settings.index') }}" class="nav-link">
								<i class="nav-icon bi bi-envelope"></i>
								<p>Email Settings</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.payment-gateways.index') }}" class="nav-link">
								<i class="nav-icon bi bi-credit-card"></i>
								<p>Payment Gateways</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.shipping-settings.index') }}" class="nav-link">
								<i class="nav-icon bi bi-truck"></i>
								<p>Shipping Settings</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.otp-settings.index') }}" class="nav-link">
								<i class="nav-icon bi bi-shield-lock"></i>
								<p>OTP Settings</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.coin-settings.index') }}" class="nav-link">
								<i class="nav-icon bi bi-coin"></i>
								<p>Coin Settings</p>
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.coupons.index') }}" class="nav-link">
						<i class="nav-icon bi bi-ticket"></i>
						<p>Coupons</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.pages.index') }}" class="nav-link">
						<i class="nav-icon bi bi-file-text"></i>
						<p>Pages</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.newsletter.index') }}" class="nav-link">
						<i class="nav-icon bi bi-envelope-paper"></i>
						<p>Newsletter</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon bi bi-star"></i>
						<p>Reviews <i class="nav-arrow bi bi-chevron-right"></i></p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="{{ route('admin.reviews.index') }}" class="nav-link">
								<i class="nav-icon bi bi-list-ul"></i>
								<p>Manage Reviews</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.site-settings.index') }}#review-settings" class="nav-link">
								<i class="nav-icon bi bi-gear"></i>
								<p>Review Settings</p>
							</a>
						</li>
					</ul>
				</li>
				
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon bi bi-activity"></i>
						<p>Activity <i class="nav-arrow bi bi-chevron-right"></i></p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="{{ route('admin.activities.carts') }}" class="nav-link">
								<i class="nav-icon bi bi-cart-plus"></i>
								<p>Cart Activity</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.activities.wishlists') }}" class="nav-link">
								<i class="nav-icon bi bi-heart"></i>
								<p>Wishlist Activity</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="{{ route('admin.activities.sessions') }}" class="nav-link">
								<i class="nav-icon bi bi-person-lines-fill"></i>
								<p>Login Activity</p>
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.currencies.index') }}" class="nav-link">
						<i class="nav-icon bi bi-currency-exchange"></i>
						<p>Currencies</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="{{ route('admin.admins.index') }}" class="nav-link">
						<i class="nav-icon bi bi-person-gear"></i>
						<p>Administrators</p>
					</a>
				</li>
				
			</ul>
		</nav>
	</div>
</aside>


