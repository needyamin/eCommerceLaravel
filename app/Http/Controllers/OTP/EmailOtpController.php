<?php

namespace App\Http\Controllers\OTP;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Support\OtpService;

class EmailOtpController extends Controller
{
    public function request(Request $request, OtpService $otpService)
    {
        $data = $request->validate([
            'email' => ['required','email','max:255'],
            'purpose' => ['nullable','string','max:50']
        ]);
        $otp = $otpService->generate('email', strtolower($data['email']), $data['purpose'] ?? 'login');
        $otpService->sendEmail($otp);
        return back()->with('success', 'OTP has been emailed.');
    }

    public function verify(Request $request, OtpService $otpService)
    {
        $data = $request->validate([
            'email' => ['required','email','max:255'],
            'otp' => ['required','digits:6'],
            'purpose' => ['nullable','string','max:50']
        ]);
        $ok = $otpService->verify('email', strtolower($data['email']), $data['otp'], $data['purpose'] ?? 'login');
        return back()->with($ok ? 'success' : 'error', $ok ? 'OTP verified.' : 'Invalid or expired OTP.');
    }
}
