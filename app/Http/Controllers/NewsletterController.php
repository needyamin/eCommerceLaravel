<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\NewsletterSubscriber;
use App\Models\SiteSetting;
use Illuminate\Support\Str;

class NewsletterController extends Controller
{
    public function subscribe(Request $request)
    {
        $settings = SiteSetting::get();
        if (!$settings->newsletter_enabled) {
            return back()->with('error', 'Newsletter is currently disabled.');
        }

        $validated = $request->validate([
            'email' => ['required', 'email', 'max:255'],
            'name' => ['nullable', 'string', 'max:255'],
            'source' => ['nullable', 'string', 'max:50'],
        ]);

        $subscriber = NewsletterSubscriber::firstOrNew(['email' => strtolower($validated['email'])]);
        $subscriber->fill([
            'name' => $validated['name'] ?? $subscriber->name,
            'source' => $validated['source'] ?? ($subscriber->exists ? $subscriber->source : 'footer'),
        ]);

        if ($settings->newsletter_double_opt_in) {
            $subscriber->status = 'unsubscribed';
            $subscriber->token = Str::uuid();
            $subscriber->save();
            // TODO: send confirmation email with route('newsletter.confirm', $subscriber->token)
            return back()->with('success', 'Please check your email to confirm your subscription.');
        }

        $subscriber->status = 'subscribed';
        $subscriber->subscribed_at = now();
        $subscriber->save();

        // TODO: optionally send welcome email if $settings->newsletter_send_welcome_email

        return back()->with('success', 'Subscribed to newsletter successfully.');
    }

    public function unsubscribe(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email'],
        ]);

        $subscriber = NewsletterSubscriber::where('email', strtolower($request->email))->first();
        if ($subscriber) {
            $subscriber->status = 'unsubscribed';
            $subscriber->unsubscribed_at = now();
            $subscriber->save();
        }

        return back()->with('success', 'You have been unsubscribed.');
    }

    public function confirm(string $token)
    {
        $subscriber = NewsletterSubscriber::where('token', $token)->firstOrFail();
        $subscriber->status = 'subscribed';
        $subscriber->subscribed_at = now();
        $subscriber->save();

        return redirect()->route('home')->with('success', 'Subscription confirmed. Thank you!');
    }
}
