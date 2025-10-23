<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>AdminLTE 4 | Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" crossorigin="anonymous" media="print" onload="this.media='all'" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" crossorigin="anonymous" />
		<link rel="stylesheet" href="{{ asset('admin-assets/css/adminlte.css') }}" />
	</head>
	<body class="login-page bg-body-secondary">
		<div class="login-box">
			<div class="login-logo">
				<a href="{{ route('admin.login') }}"><b>Admin</b>LTE</a>
			</div>
			<div class="card">
				<div class="card-body login-card-body">
					<p class="login-box-msg">Sign in to start your session</p>
					<form action="{{ route('admin.login.attempt') }}" method="post">
						@csrf
						<div class="input-group mb-3">
							<input type="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="Email" required />
							<div class="input-group-text"><span class="bi bi-envelope"></span></div>
						</div>
						<div class="input-group mb-3">
							<input type="password" name="password" class="form-control" placeholder="Password" required />
							<div class="input-group-text"><span class="bi bi-lock-fill"></span></div>
						</div>
						<div class="row">
							<div class="col-8">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="remember" id="rememberMe" />
									<label class="form-check-label" for="rememberMe"> Remember Me </label>
								</div>
							</div>
							<div class="col-4">
								<div class="d-grid gap-2">
									<button type="submit" class="btn btn-primary">Sign In</button>
								</div>
							</div>
						</div>
						@if ($errors->any())
							<div class="alert alert-danger mt-3 mb-0">{{ $errors->first() }}</div>
						@endif
					</form>
				</div>
			</div>
		</div>

		<script src="https://cdn.jsdelivr.net/npm/overlaysscrollbars@2.11.0/browser/overlayscrollbars.browser.es6.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
		<script src="{{ asset('admin-assets/js/adminlte.js') }}"></script>
	</body>
</html>


