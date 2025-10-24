<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Route;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class AdminRoutePermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $names = [];
        foreach (Route::getRoutes() as $route) {
            $name = $route->getName();
            if ($name && str_starts_with($name, 'admin.') && !str_starts_with($name, 'admin.theme') && !str_starts_with($name, 'admin.login')) {
                $names[] = $name;
            }
        }
        $names = array_values(array_unique($names));

        foreach ($names as $perm) {
            Permission::firstOrCreate(['name' => $perm, 'guard_name' => 'admin']);
        }

        $role = Role::firstOrCreate(['name' => 'Super Admin', 'guard_name' => 'admin']);
        $role->syncPermissions(Permission::where('guard_name', 'admin')->pluck('name')->toArray());
    }
}


