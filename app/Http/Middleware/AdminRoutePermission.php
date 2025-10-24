<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminRoutePermission
{
	public function handle(Request $request, Closure $next): Response
	{
		$route = $request->route();
		$name = $route?->getName();
		// Allow when no name or accessing admin auth/theme pages
		if (!$name || str_starts_with($name, 'admin.login') || $name === 'admin.logout' || str_starts_with($name, 'admin.theme')) {
			return $next($request);
		}
		$user = auth('admin')->user();
		if ($user && $user->hasPermissionTo($name, 'admin')) {
			return $next($request);
		}
		abort(403);
	}
}


