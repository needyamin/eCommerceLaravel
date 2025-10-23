<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Route as RouteFacade;

class RoleController extends Controller
{
	public function index()
	{
		$roles = Role::query()->paginate(20);
		return view('admin.roles.index', compact('roles'));
	}

	public function create()
	{
        $permissions = Permission::all();
        $routeNames = $this->adminRouteNames();
        return view('admin.roles.create', compact('permissions','routeNames'));
	}

	public function store(Request $request)
	{
		$validated = $request->validate([
			'name' => 'required|string|max:255|unique:roles,name',
		]);
        $role = Role::create(['name' => $validated['name'], 'guard_name' => 'admin']);
        $permissionNames = array_values(array_unique($request->input('permissions', [])));
        foreach ($permissionNames as $permName) {
            Permission::firstOrCreate(['name' => $permName, 'guard_name' => 'admin']);
        }
        $role->syncPermissions($permissionNames);
		return redirect()->route('admin.roles.index')->with('success', 'Role created');
	}

	public function edit(Role $role)
	{
        $permissions = Permission::all();
        $assigned = $role->permissions->pluck('id')->toArray();
        $routeNames = $this->adminRouteNames();
        return view('admin.roles.edit', compact('role', 'permissions', 'assigned','routeNames'));
	}

    protected function adminRouteNames(): array
    {
        $names = [];
        foreach (RouteFacade::getRoutes() as $route) {
            $name = $route->getName();
            if ($name && str_starts_with($name, 'admin.') && !str_starts_with($name, 'admin.theme') && !str_starts_with($name, 'admin.login')) {
                $names[] = $name;
            }
        }
        sort($names);
        return $names;
    }

	public function update(Request $request, Role $role)
	{
		$validated = $request->validate([
			'name' => 'required|string|max:255|unique:roles,name,' . $role->id,
		]);
        $role->update(['name' => $validated['name']]);
        $permissionNames = array_values(array_unique($request->input('permissions', [])));
        foreach ($permissionNames as $permName) {
            Permission::firstOrCreate(['name' => $permName, 'guard_name' => 'admin']);
        }
        $role->syncPermissions($permissionNames);
		return redirect()->route('admin.roles.index')->with('success', 'Role updated');
	}

	public function destroy(Role $role)
	{
		$role->delete();
		return redirect()->route('admin.roles.index')->with('success', 'Role deleted');
	}
}


