<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            // Add Bangladeshi address fields for billing
            $table->string('billing_division')->nullable()->after('billing_country');
            $table->string('billing_district')->nullable()->after('billing_division');
            $table->string('billing_upazila')->nullable()->after('billing_district');
            $table->string('billing_union')->nullable()->after('billing_upazila');
            
            // Add Bangladeshi address fields for shipping
            $table->string('shipping_division')->nullable()->after('shipping_country');
            $table->string('shipping_district')->nullable()->after('shipping_division');
            $table->string('shipping_upazila')->nullable()->after('shipping_district');
            $table->string('shipping_union')->nullable()->after('shipping_upazila');
            
            // Add payment transaction details
            $table->string('payment_transaction_id')->nullable()->after('payment_method');
            $table->text('payment_transaction_details')->nullable()->after('payment_transaction_id');
            
            // Add shipping courier details
            $table->string('shipping_courier')->nullable()->after('shipping_method');
            $table->string('shipping_tracking_number')->nullable()->after('shipping_courier');
            
            // Change default currency to BDT (if column exists)
            if (Schema::hasColumn('orders', 'currency')) {
                $table->string('currency', 3)->default('BDT')->change();
            }
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn([
                'billing_division', 'billing_district', 'billing_upazila', 'billing_union',
                'shipping_division', 'shipping_district', 'shipping_upazila', 'shipping_union',
                'payment_transaction_id', 'payment_transaction_details',
                'shipping_courier', 'shipping_tracking_number'
            ]);
            $table->string('currency', 3)->default('USD')->change();
        });
    }
};

