<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Currency extends Model
{
    use HasFactory;

    protected $fillable = [
        'code', 'name', 'symbol', 'precision', 'thousand_separator', 'decimal_separator',
        'symbol_first', 'rate', 'is_active', 'is_default'
    ];

    protected $casts = [
        'precision' => 'integer',
        'symbol_first' => 'boolean',
        'rate' => 'decimal:8',
        'is_active' => 'boolean',
        'is_default' => 'boolean',
    ];

    public static function default(): ?self
    {
        return static::where('is_default', true)->first();
    }
}
