<nav class="app-header navbar navbar-expand bg-body">
	<div class="container-fluid">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
					<i class="bi bi-list"></i>
				</a>
			</li>
			<li class="nav-item d-none d-md-block"><a href="{{ route('home') }}" class="nav-link">Site</a></li>
		</ul>
		<ul class="navbar-nav ms-auto">
			<li class="nav-item">
				<form action="{{ route('admin.logout') }}" method="post" class="m-0">
					@csrf
					<button class="btn btn-link nav-link">Logout</button>
				</form>
			</li>
		</ul>
	</div>
</nav>


