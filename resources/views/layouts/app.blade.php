<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>@yield('title', 'eCommerce')</title>
	@vite(['resources/css/app.css','resources/js/app.js'])
</head>
<body class="min-h-screen flex flex-col">
	@include('partials.nav')
	<main class="container mx-auto py-6 flex-1">
		@if (session('success'))
			<div class="bg-green-100 text-green-800 p-3 rounded mb-4">{{ session('success') }}</div>
		@endif
		@yield('content')
	</main>
	@include('partials.footer')
</body>
</html>


