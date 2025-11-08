<?php

namespace App\Support;

use App\Models\Currency;

class CurrencyManager
{
    const SESSION_KEY = 'currency_code';

    public static function current(): Currency
    {
        // Always use the default currency globally
        return Currency::default() ?: Currency::firstOrFail();
    }

    public static function set(string $code): bool
    {
        // Only allow admin to set currency for the application session
        if (!auth('admin')->check()) {
            return false;
        }
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

    /**
     * Convert a base amount to the current currency numeric value (no symbol, no formatting).
     */
    public static function convert(float $amount, ?Currency $currency = null, ?int $precisionOverride = null): float
    {
        $c = $currency ?: self::current();
        $precision = $precisionOverride ?? (int) $c->precision;
        $value = $amount * (float) $c->rate;
        return round($value, $precision);
    }

    /**
     * Get the default currency (alias for current() for backward compatibility)
     */
    public static function getDefaultCurrency(): ?Currency
    {
        return Currency::default();
    }
}
