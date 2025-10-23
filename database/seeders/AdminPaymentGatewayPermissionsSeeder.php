<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class AdminPaymentGatewayPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $permissions = [
            'admin.payment-gateways.index',
            'admin.payment-gateways.show',
            'admin.payment-gateways.update',
            'admin.payment-gateways.toggle-status',
            'admin.payment-gateways.test',
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
