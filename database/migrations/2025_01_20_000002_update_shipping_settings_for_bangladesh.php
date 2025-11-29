<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('shipping_settings', function (Blueprint $table) {
            // Add flat_rate if not exists (from previous migration)
            if (!Schema::hasColumn('shipping_settings', 'flat_rate')) {
                $table->decimal('flat_rate', 10, 2)->default(0)->after('enabled');
            }
            
            // Add Bangladeshi-specific shipping fields
            $table->json('division_rates')->nullable()->after('country_rates'); // Division-based rates
            $table->json('district_rates')->nullable()->after('division_rates'); // District-based rates
            $table->json('courier_services')->nullable()->after('district_rates'); // Available courier services
            $table->boolean('weight_based_enabled')->default(false)->after('courier_services');
            $table->decimal('weight_base_rate', 10, 2)->default(0)->after('weight_based_enabled');
            $table->decimal('weight_per_kg_rate', 10, 2)->default(0)->after('weight_base_rate');
        });
    }

    public function down(): void
    {
        Schema::table('shipping_settings', function (Blueprint $table) {
            $table->dropColumn([
                'division_rates',
                'district_rates',
                'courier_services',
                'weight_based_enabled',
                'weight_base_rate',
                'weight_per_kg_rate'
            ]);
        });
    }
};

