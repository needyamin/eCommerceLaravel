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
        Schema::table('otp_settings', function (Blueprint $table) {
            $table->string('sms_api_url')->nullable();
            $table->string('sms_api_key')->nullable();
            $table->string('sms_username')->nullable();
            $table->string('sms_password')->nullable();
            $table->string('sms_sender')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('otp_settings', function (Blueprint $table) {
            $table->dropColumn(['sms_api_url','sms_api_key','sms_username','sms_password','sms_sender']);
        });
    }
};
