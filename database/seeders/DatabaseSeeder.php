<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Admin;
use App\Models\Currency;
use App\Models\Coupon;
use App\Models\PaymentGatewaySetting;
use App\Models\SiteSetting;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
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
        
        // Use AdminRoutePermissionsSeeder to automatically discover all admin routes
        $this->call(AdminRoutePermissionsSeeder::class);
        
        // Ensure Super Admin has all permissions
        $super->syncPermissions(Permission::where('guard_name', 'admin')->pluck('name')->toArray());

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
                // 3 images per product: generate valid JPEGs on the public disk
                $images = collect(range(1, 3))->map(function ($i) use ($product) {
                    $filename = 'products/' . Str::uuid() . '.jpg';
                    $width = 600; $height = 450;
                    try {
                        if (function_exists('imagecreatetruecolor')) {
                            $img = imagecreatetruecolor($width, $height);
                            $bg = imagecolorallocate($img, rand(150, 230), rand(150, 230), rand(150, 230));
                            imagefilledrectangle($img, 0, 0, $width, $height, $bg);
                            $fg = imagecolorallocate($img, 60, 60, 60);
                            // simple border
                            imagerectangle($img, 2, 2, $width - 3, $height - 3, $fg);
                            ob_start();
                            imagejpeg($img, null, 85);
                            $data = ob_get_clean();
                            imagedestroy($img);
                            Storage::disk('public')->put($filename, $data);
                        } else {
                            // Fallback: copy an existing public asset if GD is unavailable
                            $fallback = base_path('public/admin-assets/assets/img/featured-1.jpg');
                            if (!file_exists($fallback)) {
                                // try any image in admin-assets
                                $glob = glob(base_path('public/admin-assets/assets/*.{jpg,png}'), GLOB_BRACE);
                                $fallback = $glob ? $glob[0] : null;
                            }
                            if ($fallback) {
                                Storage::disk('public')->put($filename, file_get_contents($fallback));
                            } else {
                                // last-resort: write an empty valid JPEG header
                                Storage::disk('public')->put($filename, hex2bin('FFD8FFE000104A46494600010100000100010000FFDB004300'));
                            }
                        }
                    } catch (\Throwable $e) {
                        // ensure file exists even if generation fails
                        Storage::disk('public')->put($filename, '');
                    }
                    return ProductImage::create([
                        'product_id' => $product->id,
                        'path' => $filename,
                        'position' => $i - 1,
                        'is_primary' => false,
                    ]);
                });
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
        $currencies = [
            ['code' => 'BDT', 'name' => 'Bangladeshi Taka', 'symbol' => '৳', 'precision' => 2, 'thousand_separator' => ',', 'decimal_separator' => '.', 'symbol_first' => true, 'rate' => 110.00, 'is_active' => true, 'is_default' => true],
            ['code' => 'USD', 'name' => 'US Dollar', 'symbol' => '$', 'precision' => 2, 'thousand_separator' => ',', 'decimal_separator' => '.', 'symbol_first' => true, 'rate' => 1, 'is_active' => true, 'is_default' => false],
            ['code' => 'EUR', 'name' => 'Euro', 'symbol' => '€', 'precision' => 2, 'thousand_separator' => '.', 'decimal_separator' => ',', 'symbol_first' => true, 'rate' => 0.92, 'is_active' => true, 'is_default' => false],
            ['code' => 'GBP', 'name' => 'British Pound', 'symbol' => '£', 'precision' => 2, 'thousand_separator' => ',', 'decimal_separator' => '.', 'symbol_first' => true, 'rate' => 0.78, 'is_active' => true, 'is_default' => false],
        ];
        foreach ($currencies as $data) {
            Currency::updateOrCreate(['code' => $data['code']], $data);
        }

        // Admin currency permissions
        $currencyPermissions = [
            'admin.currencies.index',
            'admin.currencies.create',
            'admin.currencies.store',
            'admin.currencies.edit',
            'admin.currencies.update',
            'admin.currencies.destroy',
            'admin.currencies.toggle',
            'admin.currencies.default',
        ];
        foreach ($currencyPermissions as $name) {
            Permission::firstOrCreate([
                'name' => $name,
                'guard_name' => 'admin',
            ]);
        }
        $super->givePermissionTo(Permission::whereIn('name', $currencyPermissions)->where('guard_name', 'admin')->get());

        // Payment gateway settings
        PaymentGatewaySetting::setGatewaySetting('stripe', 'enabled', false, 'Enable or disable Stripe payment gateway');
        PaymentGatewaySetting::setGatewaySetting('stripe', 'publishable_key', '', 'Stripe publishable key (starts with pk_)');
        PaymentGatewaySetting::setGatewaySetting('stripe', 'secret_key', '', 'Stripe secret key (starts with sk_)', true);
        PaymentGatewaySetting::setGatewaySetting('stripe', 'webhook_secret', '', 'Stripe webhook endpoint secret', true);
        PaymentGatewaySetting::setGatewaySetting('paypal', 'enabled', false, 'Enable or disable PayPal payment gateway');
        PaymentGatewaySetting::setGatewaySetting('paypal', 'client_id', '', 'PayPal application client ID');
        PaymentGatewaySetting::setGatewaySetting('paypal', 'client_secret', '', 'PayPal application client secret', true);
        PaymentGatewaySetting::setGatewaySetting('paypal', 'sandbox_mode', true, 'Use PayPal sandbox for testing');

        // Coupons
        $coupons = [
            [
                'code' => 'WELCOME10',
                'name' => 'Welcome Discount',
                'description' => 'Get 10% off your first order',
                'type' => 'percentage',
                'value' => 10.00,
                'minimum_amount' => 50.00,
                'maximum_discount' => 25.00,
                'usage_limit' => 100,
                'usage_limit_per_user' => 1,
                'starts_at' => now(),
                'expires_at' => now()->addMonths(3),
                'is_active' => true,
            ],
            [
                'code' => 'SAVE20',
                'name' => 'Save $20',
                'description' => 'Get $20 off orders over $100',
                'type' => 'fixed',
                'value' => 20.00,
                'minimum_amount' => 100.00,
                'maximum_discount' => null,
                'usage_limit' => 50,
                'usage_limit_per_user' => 2,
                'starts_at' => now(),
                'expires_at' => now()->addMonths(2),
                'is_active' => true,
            ],
            [
                'code' => 'FREESHIP',
                'name' => 'Free Shipping',
                'description' => 'Free shipping on any order',
                'type' => 'fixed',
                'value' => 10.00,
                'minimum_amount' => null,
                'maximum_discount' => null,
                'usage_limit' => 200,
                'usage_limit_per_user' => 3,
                'starts_at' => now(),
                'expires_at' => now()->addYear(),
                'is_active' => true,
            ],
            [
                'code' => 'HOLIDAY25',
                'name' => 'Holiday Special',
                'description' => '25% off for holiday season',
                'type' => 'percentage',
                'value' => 25.00,
                'minimum_amount' => 75.00,
                'maximum_discount' => 50.00,
                'usage_limit' => 30,
                'usage_limit_per_user' => 1,
                'starts_at' => now(),
                'expires_at' => now()->addDays(30),
                'is_active' => true,
            ],
            [
                'code' => 'STUDENT15',
                'name' => 'Student Discount',
                'description' => '15% off for students',
                'type' => 'percentage',
                'value' => 15.00,
                'minimum_amount' => 30.00,
                'maximum_discount' => 30.00,
                'usage_limit' => null,
                'usage_limit_per_user' => 5,
                'starts_at' => now(),
                'expires_at' => now()->addMonths(6),
                'is_active' => true,
            ],
        ];
        foreach ($coupons as $data) {
            Coupon::updateOrCreate(['code' => $data['code']], $data);
        }

        // Site Settings - Set default review settings
        $siteSettings = SiteSetting::get();
        if (!$siteSettings->reviews_enabled) {
            $siteSettings->update([
                'reviews_enabled' => true,
                'reviews_require_purchase' => false,
                'reviews_require_approval' => true,
                'reviews_allow_anonymous' => false,
            ]);
        }
        
        // Set default newsletter settings
        if (!$siteSettings->newsletter_enabled) {
            $siteSettings->update([
                'newsletter_enabled' => true,
                'newsletter_double_opt_in' => true,
                'newsletter_send_welcome_email' => true,
            ]);
        }

        // Pages
        $this->call(PageSeeder::class);
    }
}
