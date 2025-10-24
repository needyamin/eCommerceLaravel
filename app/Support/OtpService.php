<?php

namespace App\Support;

use App\Models\OtpCode;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Notification;
use App\Notifications\OtpCodeNotification;
use Carbon\Carbon;
use App\Models\OtpSetting;

class OtpService
{
    public function generate(string $channel, string $identifier, string $purpose = 'login', ?int $length = null, ?int $ttlMinutes = null): OtpCode
    {
        $settings = OtpSetting::get();
        $len = $length ?? ($settings->length ?? 6);
        $ttl = $ttlMinutes ?? ($settings->ttl_minutes ?? 10);
        $code = str_pad((string) random_int(0, (10 ** $len) - 1), $len, '0', STR_PAD_LEFT);
        $otp = OtpCode::create([
            'channel' => $channel,
            'identifier' => $identifier,
            'code' => $code,
            'purpose' => $purpose,
            'expires_at' => now()->addMinutes($ttl),
            'ip_address' => request()->ip(),
        ]);
        return $otp;
    }

    public function sendEmail(OtpCode $otp): void
    {
        Notification::route('mail', $otp->identifier)->notify(new OtpCodeNotification($otp->code, $otp->expires_at));
    }

    public function sendSms(OtpCode $otp, ?array $config = null): bool
    {
        try {
            if (class_exists('Xenon\\LaravelBDSms\\LaravelBDSms')) {
                $settings = OtpSetting::get();
                $sms = new \Xenon\LaravelBDSms\LaravelBDSms();
                $sms->setTo($otp->identifier)
                    ->setText("Your OTP is {$otp->code}. Valid till " . $otp->expires_at->format('H:i'))
                    ->setTemplate(null)
                    ->setMasking($config['masking'] ?? ($settings->sms_masking ?? ''))
                    ->setGateway($config['gateway'] ?? ($settings->sms_gateway ?? 'mim_sms'))
                    ->send();
                return true;
            }
        } catch (\Throwable $e) {
            \Log::error('SMS OTP send failed: ' . $e->getMessage());
        }
        return false;
    }

    public function verify(string $channel, string $identifier, string $code, string $purpose = 'login'): bool
    {
        $otp = OtpCode::where('channel', $channel)
            ->where('identifier', $identifier)
            ->where('purpose', $purpose)
            ->whereNull('used_at')
            ->orderByDesc('id')
            ->first();

        if (!$otp) {
            return false;
        }

        // Expiry
        if ($otp->expires_at->isPast()) {
            return false;
        }

        // Attempts rate limiting simple
        $maxAttempts = (OtpSetting::get()->max_attempts ?? 5);
        if ($otp->attempts >= $maxAttempts) {
            return false;
        }

        $otp->increment('attempts');

        if (hash_equals($otp->code, $code)) {
            $otp->used_at = now();
            $otp->save();
            return true;
        }

        return false;
    }
}
