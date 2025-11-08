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
            if ($request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Newsletter is currently disabled.'
                ], 422);
            }
            return back()->with('error', 'Newsletter is currently disabled.');
        }

        try {
            $validated = $request->validate([
                'email' => ['required', 'email', 'max:255'],
                'name' => ['nullable', 'string', 'max:255'],
                'source' => ['nullable', 'string', 'max:50'],
            ]);

            $subscriber = NewsletterSubscriber::firstOrNew(['email' => strtolower($validated['email'])]);
            $wasAlreadySubscribed = $subscriber->exists && $subscriber->status === 'subscribed';
            
            $subscriber->fill([
                'name' => $validated['name'] ?? $subscriber->name,
                'source' => $validated['source'] ?? ($subscriber->exists ? $subscriber->source : 'footer'),
            ]);

            if ($settings->newsletter_double_opt_in) {
                $subscriber->status = 'unsubscribed';
                $subscriber->token = Str::uuid();
                $subscriber->save();
                // TODO: send confirmation email with route('newsletter.confirm', $subscriber->token)
                $message = 'Please check your email to confirm your subscription.';
                
                if ($request->wantsJson()) {
                    return response()->json([
                        'success' => true,
                        'message' => $message
                    ]);
                }
                return back()->with('success', $message);
            }

            $subscriber->status = 'subscribed';
            $subscriber->subscribed_at = now();
            $subscriber->save();

            // TODO: optionally send welcome email if $settings->newsletter_send_welcome_email

            $message = $wasAlreadySubscribed 
                ? 'You are already subscribed to our newsletter!' 
                : 'Subscribed to newsletter successfully. Thank you!';

            if ($request->wantsJson()) {
                return response()->json([
                    'success' => true,
                    'message' => $message
                ]);
            }
            return back()->with('success', $message);
            
        } catch (\Illuminate\Validation\ValidationException $e) {
            if ($request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => $e->getMessage(),
                    'errors' => $e->errors()
                ], 422);
            }
            return back()->withErrors($e->errors())->withInput();
        } catch (\Throwable $e) {
            if ($request->wantsJson()) {
                return response()->json([
                    'success' => false,
                    'message' => 'An error occurred. Please try again later.'
                ], 500);
            }
            return back()->with('error', 'An error occurred. Please try again later.');
        }
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
