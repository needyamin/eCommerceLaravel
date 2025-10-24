<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShippingSetting extends Model
{
    protected $fillable = [
        'enabled','free_shipping_enabled','free_shipping_min_total','country_rates',
        'global_rate_enabled','global_rate_type','global_rate_amount'
    ];

    protected $casts = [
        'enabled' => 'boolean',
        'free_shipping_enabled' => 'boolean',
        'free_shipping_min_total' => 'decimal:2',
        'country_rates' => 'array',
        'global_rate_enabled' => 'boolean',
        'global_rate_amount' => 'decimal:2',
    ];

    public static function get(): self
    {
        return static::first() ?? static::create([]);
    }
}


