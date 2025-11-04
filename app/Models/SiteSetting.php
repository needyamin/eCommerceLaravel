<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model
{
    protected $fillable = [
        'site_name','site_tagline','logo_url','favicon_url','meta_title','meta_description','meta_keywords',
        'footer_text','privacy_url','terms_url','cookies_url','wishlist_enabled','social_facebook','social_twitter','social_instagram','social_linkedin'
    ];

    public static function get(): self
    {
        return static::first() ?? static::create([]);
    }
}


