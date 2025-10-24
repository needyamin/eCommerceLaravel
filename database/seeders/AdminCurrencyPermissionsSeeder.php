<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class AdminCurrencyPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $permissions = [
            'admin.currencies.index',
            'admin.currencies.create',
            'admin.currencies.store',
            'admin.currencies.edit',
            'admin.currencies.update',
            'admin.currencies.destroy',
            'admin.currencies.toggle',
            'admin.currencies.default',
        ];

        foreach ($permissions as $name) {
            Permission::firstOrCreate([
                'name' => $name,
                'guard_name' => 'admin',
            ]);
        }

        $role = Role::firstOrCreate(['name' => 'Super Admin', 'guard_name' => 'admin']);
        $role->givePermissionTo(Permission::whereIn('name', $permissions)->where('guard_name', 'admin')->get());
    }
}
