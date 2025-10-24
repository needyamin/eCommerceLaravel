<?php

namespace App\Http\Controllers\OTP;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Support\OtpService;

class SmsOtpController extends Controller
{
    public function request(Request $request, OtpService $otpService)
    {
        $data = $request->validate([
            'phone' => ['required','string','max:20'],
            'purpose' => ['nullable','string','max:50']
        ]);
        $otp = $otpService->generate('sms', $data['phone'], $data['purpose'] ?? 'login');
        $sent = $otpService->sendSms($otp, [
            'gateway' => config('services.sms.gateway', 'mim_sms'),
            'masking' => config('services.sms.masking', ''),
        ]);
        return back()->with($sent ? 'success' : 'error', $sent ? 'OTP sent via SMS.' : 'Failed to send SMS OTP.');
    }

    public function verify(Request $request, OtpService $otpService)
    {
        $data = $request->validate([
            'phone' => ['required','string','max:20'],
            'otp' => ['required','digits:6'],
            'purpose' => ['nullable','string','max:50']
        ]);
        $ok = $otpService->verify('sms', $data['phone'], $data['otp'], $data['purpose'] ?? 'login');
        return back()->with($ok ? 'success' : 'error', $ok ? 'OTP verified.' : 'Invalid or expired OTP.');
    }
}
