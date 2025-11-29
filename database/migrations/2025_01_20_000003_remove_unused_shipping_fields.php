<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('shipping_settings', function (Blueprint $table) {
            // Remove courier_services and country_rates columns
            if (Schema::hasColumn('shipping_settings', 'courier_services')) {
                $table->dropColumn('courier_services');
            }
            if (Schema::hasColumn('shipping_settings', 'country_rates')) {
                $table->dropColumn('country_rates');
            }
        });
    }

    public function down(): void
    {
        Schema::table('shipping_settings', function (Blueprint $table) {
            // Restore columns if needed
            $table->json('courier_services')->nullable();
            $table->json('country_rates')->nullable();
        });
    }
};

