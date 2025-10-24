<?php

namespace App\Support;

use App\Models\Currency;

class CurrencyManager
{
    const SESSION_KEY = 'currency_code';

    public static function current(): Currency
    {
        $code = session(self::SESSION_KEY);
        $currency = null;
        if ($code) {
            $currency = Currency::where('code', $code)->where('is_active', true)->first();
        }
        return $currency ?: (Currency::default() ?: Currency::firstOrFail());
    }

    public static function set(string $code): bool
    {
        $currency = Currency::where('code', strtoupper($code))->where('is_active', true)->first();
        if (!$currency) {
            return false;
        }
        session([self::SESSION_KEY => $currency->code]);
        return true;
    }

    public static function format(float $amount, ?Currency $currency = null): string
    {
        $c = $currency ?: self::current();
        $value = $amount * (float) $c->rate;
        $formatted = number_format($value, $c->precision, $c->decimal_separator, $c->thousand_separator);
        return $c->symbol_first
            ? ($c->symbol . $formatted)
            : ($formatted . ' ' . $c->symbol);
    }
}
