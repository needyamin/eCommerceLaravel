<?php

namespace Database\Seeders;

use App\Models\Coupon;
use Illuminate\Database\Seeder;

class CouponSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
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

        foreach ($coupons as $couponData) {
            Coupon::create($couponData);
        }
    }
}