<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SiteSetting;

class SiteSettingsController extends Controller
{
    public function index()
    {
        $settings = SiteSetting::get();
        return view('admin.site-settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'site_name' => ['required','string','max:100'],
            'site_tagline' => ['nullable','string','max:150'],
            'logo_url' => ['nullable','string','max:255'],
            'favicon_url' => ['nullable','string','max:255'],
            'meta_title' => ['nullable','string','max:255'],
            'meta_description' => ['nullable','string','max:500'],
            'meta_keywords' => ['nullable','string','max:500'],
            'footer_text' => ['nullable','string','max:500'],
            'privacy_url' => ['nullable','string','max:255'],
            'terms_url' => ['nullable','string','max:255'],
            'cookies_url' => ['nullable','string','max:255'],
            'help_center_url' => ['nullable','string','max:255'],
            'shipping_info_url' => ['nullable','string','max:255'],
            'returns_url' => ['nullable','string','max:255'],
            'contact_us_url' => ['nullable','string','max:255'],
            'wishlist_enabled' => ['nullable','boolean'],
            'reviews_enabled' => ['nullable','boolean'],
            'reviews_require_purchase' => ['nullable','boolean'],
            'reviews_require_approval' => ['nullable','boolean'],
            'reviews_allow_anonymous' => ['nullable','boolean'],
            'newsletter_enabled' => ['nullable','boolean'],
            'newsletter_double_opt_in' => ['nullable','boolean'],
            'newsletter_send_welcome_email' => ['nullable','boolean'],
            'social_facebook' => ['nullable','string','max:255'],
            'social_twitter' => ['nullable','string','max:255'],
            'social_instagram' => ['nullable','string','max:255'],
            'social_linkedin' => ['nullable','string','max:255'],
            'product_display_columns_mobile' => ['nullable','integer','min:1','max:4'],
            'product_display_columns_desktop' => ['nullable','integer','min:1','max:6'],
        ]);
        $data['wishlist_enabled'] = (bool) ($request->input('wishlist_enabled') ?? false);
        $data['reviews_enabled'] = (bool) ($request->input('reviews_enabled') ?? false);
        $data['reviews_require_purchase'] = (bool) ($request->input('reviews_require_purchase') ?? false);
        $data['reviews_require_approval'] = (bool) ($request->input('reviews_require_approval') ?? false);
        $data['reviews_allow_anonymous'] = (bool) ($request->input('reviews_allow_anonymous') ?? false);
        $data['newsletter_enabled'] = (bool) ($request->input('newsletter_enabled') ?? false);
        $data['newsletter_double_opt_in'] = (bool) ($request->input('newsletter_double_opt_in') ?? false);
        $data['newsletter_send_welcome_email'] = (bool) ($request->input('newsletter_send_welcome_email') ?? false);
        $data['product_display_columns_mobile'] = (int) ($request->input('product_display_columns_mobile') ?? 2);
        $data['product_display_columns_desktop'] = (int) ($request->input('product_display_columns_desktop') ?? 3);
        $settings = SiteSetting::get();
        $settings->update($data);
        return back()->with('success','Site settings updated.');
    }
}


