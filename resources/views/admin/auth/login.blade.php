<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>AdminPanel</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" crossorigin="anonymous" media="print" onload="this.media='all'" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" crossorigin="anonymous" />
		<link rel="stylesheet" href="{{ asset('admin-assets/css/adminlte.css') }}" />
	</head>
	<body class="min-vh-100 bg-body-secondary">
		<div class="container">
			<div class="row justify-content-center py-5">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">
					<div class="card shadow-sm border-0 overflow-hidden">
						<div class="p-4 p-lg-5">
						<div class="text-center mb-4">
							<a href="{{ route('admin.login') }}" class="text-decoration-none text-body">
								<span class="fw-bold fs-3">eCommerce <span class="text-primary">Admin</span></span>
							</a>
						</div>
						<p class="text-muted small mb-3">Sign in to start your session</p>
						<form action="{{ route('admin.login.attempt') }}" method="post" class="d-grid gap-3">
						@csrf
							<div>
								<label class="form-label">Email</label>
								<div class="input-group">
									<span class="input-group-text"><i class="bi bi-envelope"></i></span>
									<input type="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="name@example.com" required />
								</div>
							</div>
							<div>
								<label class="form-label d-flex justify-content-between align-items-center">
									<span>Password</span>
									<a href="#" class="small text-decoration-none">Forgot?</a>
								</label>
								<div class="input-group">
									<span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
									<input type="password" name="password" class="form-control" placeholder="••••••••" required />
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="remember" id="rememberMe" />
									<label class="form-check-label" for="rememberMe"> Remember me </label>
								</div>
								<button type="submit" class="btn btn-primary">
									<i class="bi bi-box-arrow-in-right me-1"></i> Sign In
								</button>
							</div>
						@if ($errors->any())
                            <div class="alert alert-danger mt-3 mb-0">{{ $errors->first() }}</div>
						@endif
						</form>
						</div>
					</div>
				</div>
			</div>

		<script src="https://cdn.jsdelivr.net/npm/overlaysscrollbars@2.11.0/browser/overlayscrollbars.browser.es6.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
		<script src="{{ asset('admin-assets/js/adminlte.js') }}"></script>
	</body>
</html>


