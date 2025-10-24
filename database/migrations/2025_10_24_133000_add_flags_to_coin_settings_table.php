<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('coin_settings', function (Blueprint $table) {
            if (!Schema::hasColumn('coin_settings', 'coins_enabled')) {
                $table->boolean('coins_enabled')->default(true)->after('id');
            }
            if (!Schema::hasColumn('coin_settings', 'add_to_cart_enabled')) {
                $table->boolean('add_to_cart_enabled')->default(true)->after('coins_enabled');
            }
            if (!Schema::hasColumn('coin_settings', 'order_award_enabled')) {
                $table->boolean('order_award_enabled')->default(true)->after('add_to_cart_enabled');
            }
            if (!Schema::hasColumn('coin_settings', 'cod_bonus_enabled')) {
                $table->boolean('cod_bonus_enabled')->default(true)->after('order_award_enabled');
            }
            if (!Schema::hasColumn('coin_settings', 'referral_enabled')) {
                $table->boolean('referral_enabled')->default(true)->after('cod_bonus_enabled');
            }
        });
    }

    public function down(): void
    {
        Schema::table('coin_settings', function (Blueprint $table) {
            if (Schema::hasColumn('coin_settings', 'referral_enabled')) {
                $table->dropColumn('referral_enabled');
            }
            if (Schema::hasColumn('coin_settings', 'cod_bonus_enabled')) {
                $table->dropColumn('cod_bonus_enabled');
            }
            if (Schema::hasColumn('coin_settings', 'order_award_enabled')) {
                $table->dropColumn('order_award_enabled');
            }
            if (Schema::hasColumn('coin_settings', 'add_to_cart_enabled')) {
                $table->dropColumn('add_to_cart_enabled');
            }
            if (Schema::hasColumn('coin_settings', 'coins_enabled')) {
                $table->dropColumn('coins_enabled');
            }
        });
    }
};


