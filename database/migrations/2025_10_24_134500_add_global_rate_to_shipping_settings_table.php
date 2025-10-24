<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('shipping_settings', function (Blueprint $table) {
            if (!Schema::hasColumn('shipping_settings', 'global_rate_enabled')) {
                $table->boolean('global_rate_enabled')->default(false)->after('country_rates');
            }
            if (!Schema::hasColumn('shipping_settings', 'global_rate_type')) {
                $table->string('global_rate_type', 20)->default('flat')->after('global_rate_enabled');
            }
            if (!Schema::hasColumn('shipping_settings', 'global_rate_amount')) {
                $table->decimal('global_rate_amount', 10, 2)->default(0)->after('global_rate_type');
            }
        });
    }

    public function down(): void
    {
        Schema::table('shipping_settings', function (Blueprint $table) {
            if (Schema::hasColumn('shipping_settings', 'global_rate_amount')) {
                $table->dropColumn('global_rate_amount');
            }
            if (Schema::hasColumn('shipping_settings', 'global_rate_type')) {
                $table->dropColumn('global_rate_type');
            }
            if (Schema::hasColumn('shipping_settings', 'global_rate_enabled')) {
                $table->dropColumn('global_rate_enabled');
            }
        });
    }
};


