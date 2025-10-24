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
            'social_facebook' => ['nullable','string','max:255'],
            'social_twitter' => ['nullable','string','max:255'],
            'social_instagram' => ['nullable','string','max:255'],
            'social_linkedin' => ['nullable','string','max:255'],
        ]);
        $settings = SiteSetting::get();
        $settings->update($data);
        return back()->with('success','Site settings updated.');
    }
}


