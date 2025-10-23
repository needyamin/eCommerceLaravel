<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EmailSetting;
use Illuminate\Http\Request;

class EmailSettingsController extends Controller
{
    public function index()
    {
        $settings = EmailSetting::all();
        return view('admin.email-settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'settings' => 'required|array',
            'settings.*' => 'required|string',
        ]);

        foreach ($request->settings as $key => $value) {
            EmailSetting::set($key, $value);
        }

        return redirect()->route('admin.email-settings.index')
            ->with('success', 'Email settings updated successfully!');
    }
}