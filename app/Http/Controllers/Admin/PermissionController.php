<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{
	public function index()
	{
		$permissions = Permission::query()->paginate(20);
		return view('admin.permissions.index', compact('permissions'));
	}

	public function create()
	{
		return view('admin.permissions.create');
	}

	public function store(Request $request)
	{
		$validated = $request->validate([
			'name' => 'required|string|max:255|unique:permissions,name',
		]);
		Permission::create(['name' => $validated['name'], 'guard_name' => 'admin']);
		return redirect()->route('admin.permissions.index')->with('success', 'Permission created');
	}

	public function edit(Permission $permission)
	{
		return view('admin.permissions.edit', compact('permission'));
	}

	public function update(Request $request, Permission $permission)
	{
		$validated = $request->validate([
			'name' => 'required|string|max:255|unique:permissions,name,' . $permission->id,
		]);
		$permission->update(['name' => $validated['name']]);
		return redirect()->route('admin.permissions.index')->with('success', 'Permission updated');
	}

	public function destroy(Permission $permission)
	{
		$permission->delete();
		return redirect()->route('admin.permissions.index')->with('success', 'Permission deleted');
	}
}


