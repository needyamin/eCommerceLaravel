<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Currency;

class CurrencySeeder extends Seeder
{
    public function run(): void
    {
        $currencies = [
            ['code' => 'BDT', 'name' => 'Bangladeshi Taka', 'symbol' => '৳', 'precision' => 2, 'thousand_separator' => ',', 'decimal_separator' => '.', 'symbol_first' => true, 'rate' => 110.00, 'is_active' => true, 'is_default' => true],
            ['code' => 'USD', 'name' => 'US Dollar', 'symbol' => '$', 'precision' => 2, 'thousand_separator' => ',', 'decimal_separator' => '.', 'symbol_first' => true, 'rate' => 1, 'is_active' => true, 'is_default' => false],
            ['code' => 'EUR', 'name' => 'Euro', 'symbol' => '€', 'precision' => 2, 'thousand_separator' => '.', 'decimal_separator' => ',', 'symbol_first' => true, 'rate' => 0.92, 'is_active' => true, 'is_default' => false],
            ['code' => 'GBP', 'name' => 'British Pound', 'symbol' => '£', 'precision' => 2, 'thousand_separator' => ',', 'decimal_separator' => '.', 'symbol_first' => true, 'rate' => 0.78, 'is_active' => true, 'is_default' => false],
        ];

        foreach ($currencies as $data) {
            Currency::updateOrCreate(['code' => $data['code']], $data);
        }
    }
}
