<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model
{
    protected $fillable = [
        'site_name','site_tagline','logo_url','favicon_url','meta_title','meta_description','meta_keywords',
        'footer_text','privacy_url','terms_url','cookies_url','help_center_url','shipping_info_url','returns_url','contact_us_url',
        'wishlist_enabled','social_facebook','social_twitter','social_instagram','social_linkedin',
        'reviews_enabled','reviews_require_purchase','reviews_require_approval','reviews_allow_anonymous',
        'newsletter_enabled','newsletter_double_opt_in','newsletter_send_welcome_email',
        'product_display_columns_mobile','product_display_columns_desktop'
    ];

    protected $casts = [
        'wishlist_enabled' => 'boolean',
        'reviews_enabled' => 'boolean',
        'reviews_require_purchase' => 'boolean',
        'reviews_require_approval' => 'boolean',
        'reviews_allow_anonymous' => 'boolean',
        'newsletter_enabled' => 'boolean',
        'newsletter_double_opt_in' => 'boolean',
        'newsletter_send_welcome_email' => 'boolean',
    ];

    public static function get(): self
    {
        return static::first() ?? static::create([]);
    }
}


