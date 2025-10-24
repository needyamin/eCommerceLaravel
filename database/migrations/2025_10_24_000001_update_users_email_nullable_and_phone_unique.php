<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $driver = Schema::getConnection()->getDriverName();

        if ($driver === 'mysql') {
            DB::statement('ALTER TABLE `users` MODIFY `email` VARCHAR(255) NULL');
        } elseif ($driver === 'pgsql') {
            DB::statement('ALTER TABLE users ALTER COLUMN email DROP NOT NULL');
        } elseif ($driver === 'sqlsrv') {
            DB::statement('ALTER TABLE [users] ALTER COLUMN [email] NVARCHAR(255) NULL');
        } else {
            // For sqlite or unknown drivers, attempt a best-effort change; if unsupported, developer may need to adjust manually
            try {
                Schema::table('users', function (Blueprint $table) {
                    $table->string('email')->nullable()->change();
                });
            } catch (\Throwable $e) {
                // noop
            }
        }

        Schema::table('users', function (Blueprint $table) {
            // Ensure a unique index exists on phone for uniqueness (nullable unique allowed)
            if (!self::indexExists('users', 'users_phone_unique')) {
                $table->unique('phone');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $driver = Schema::getConnection()->getDriverName();

        Schema::table('users', function (Blueprint $table) {
            // Drop unique index on phone if exists
            if (self::indexExists('users', 'users_phone_unique')) {
                $table->dropUnique('users_phone_unique');
            }
        });

        if ($driver === 'mysql') {
            DB::statement('ALTER TABLE `users` MODIFY `email` VARCHAR(255) NOT NULL');
        } elseif ($driver === 'pgsql') {
            DB::statement('ALTER TABLE users ALTER COLUMN email SET NOT NULL');
        } elseif ($driver === 'sqlsrv') {
            DB::statement('ALTER TABLE [users] ALTER COLUMN [email] NVARCHAR(255) NOT NULL');
        } else {
            try {
                Schema::table('users', function (Blueprint $table) {
                    $table->string('email')->nullable(false)->change();
                });
            } catch (\Throwable $e) {
                // noop
            }
        }
    }

    protected static function indexExists(string $table, string $index): bool
    {
        $connection = Schema::getConnection();
        $schemaManager = $connection->getDoctrineSchemaManager();
        $indexes = $schemaManager->listTableIndexes($table);
        return array_key_exists($index, $indexes);
    }
};


