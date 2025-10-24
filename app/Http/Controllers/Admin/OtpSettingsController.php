<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\OtpSetting;

class OtpSettingsController extends Controller
{
    public function index()
    {
        $settings = OtpSetting::get();
        return view('admin.otp-settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'email_enabled' => ['nullable','boolean'],
            'sms_enabled' => ['nullable','boolean'],
            'length' => ['required','integer','min:4','max:8'],
            'ttl_minutes' => ['required','integer','min:1','max:60'],
            'max_attempts' => ['required','integer','min:1','max:10'],
            'sms_gateway' => ['nullable','string','max:100'],
            'sms_masking' => ['nullable','string','max:50'],
            'sms_api_url' => ['nullable','string','max:255'],
            'sms_api_key' => ['nullable','string','max:255'],
            'sms_username' => ['nullable','string','max:255'],
            'sms_password' => ['nullable','string','max:255'],
            'sms_sender' => ['nullable','string','max:100'],
        ]);
        $settings = OtpSetting::get();
        $settings->update([
            'email_enabled' => $request->boolean('email_enabled'),
            'sms_enabled' => $request->boolean('sms_enabled'),
            'length' => $data['length'],
            'ttl_minutes' => $data['ttl_minutes'],
            'max_attempts' => $data['max_attempts'],
            'sms_gateway' => $data['sms_gateway'] ?? null,
            'sms_masking' => $data['sms_masking'] ?? null,
            'sms_api_url' => $data['sms_api_url'] ?? null,
            'sms_api_key' => $data['sms_api_key'] ?? null,
            'sms_username' => $data['sms_username'] ?? null,
            'sms_password' => $data['sms_password'] ?? null,
            'sms_sender' => $data['sms_sender'] ?? null,
        ]);
        return back()->with('success','OTP settings updated.');
    }
}
