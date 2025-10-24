<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Admin;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Admin/test user (idempotent)
        User::query()->firstOrCreate(
            ['email' => 'test@example.com'],
            [
                'name' => 'Test User',
                'password' => bcrypt('password'),
            ]
        );

        // Default admin
        Admin::query()->firstOrCreate(
            ['email' => 'admin@example.com'],
            [
                'name' => 'Admin',
                'password' => bcrypt('password'),
            ]
        );

        // Roles & Permissions (idempotent)
        $super = Role::firstOrCreate(['name' => 'Super Admin', 'guard_name' => 'admin']);
        
        // Create specific route-based permissions
        $permissions = [
            'admin.dashboard',
            'admin.categories.index',
            'admin.categories.create',
            'admin.categories.store',
            'admin.categories.show',
            'admin.categories.edit',
            'admin.categories.update',
            'admin.categories.destroy',
            'admin.products.index',
            'admin.products.create',
            'admin.products.store',
            'admin.products.show',
            'admin.products.edit',
            'admin.products.update',
            'admin.products.destroy',
            'admin.orders.index',
            'admin.orders.show',
            'admin.orders.update',
            'admin.users.index',
            'admin.users.show',
            'admin.users.edit',
            'admin.users.update',
            'admin.users.destroy',
            'admin.users.reset-password',
            'admin.users.toggle-status',
            'admin.email-settings.index',
            'admin.email-settings.update',
            'admin.roles.index',
            'admin.roles.create',
            'admin.roles.store',
            'admin.roles.edit',
            'admin.roles.update',
            'admin.roles.destroy',
            'admin.permissions.index',
            'admin.permissions.create',
            'admin.permissions.store',
            'admin.permissions.edit',
            'admin.permissions.update',
            'admin.permissions.destroy',
        ];
        
        foreach ($permissions as $permission) {
            Permission::firstOrCreate(['name' => $permission, 'guard_name' => 'admin']);
        }
        
        $super->givePermissionTo(Permission::where('guard_name', 'admin')->get());

        // Ensure payment gateway permissions exist and assign to Super Admin
        (new \Database\Seeders\AdminPaymentGatewayPermissionsSeeder())->run();

        $admin = Admin::where('email', 'admin@example.com')->first();
        if ($admin && !$admin->hasRole('Super Admin')) {
            $admin->assignRole('Super Admin');
        }

        // Categories
        $categories = Category::factory()->count(6)->create();

        // Products with images
        $categories->each(function (Category $category) {
            Product::factory()->count(12)->create([
                'category_id' => $category->id,
            ])->each(function (Product $product) {
                // 3 images per product
                $images = ProductImage::factory()->count(3)->create([
                    'product_id' => $product->id,
                ]);
                // mark first as primary
                $first = $images->first();
                if ($first) {
                    $first->is_primary = true;
                    $first->position = 1;
                    $first->save();
                }
            });
        });

        // Currencies
        (new \Database\Seeders\CurrencySeeder())->run();
        (new \Database\Seeders\AdminCurrencyPermissionsSeeder())->run();
    }
}
