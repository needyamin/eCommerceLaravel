<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            if (Schema::hasColumn('orders', 'billing_union')) {
                $table->dropColumn('billing_union');
            }
            if (Schema::hasColumn('orders', 'shipping_union')) {
                $table->dropColumn('shipping_union');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('billing_union')->nullable()->after('billing_upazila');
            $table->string('shipping_union')->nullable()->after('shipping_upazila');
        });
    }
};
