<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\NewsletterSubscriber;
use App\Models\NewsletterSetting;

class NewsletterController extends Controller
{
    public function index()
    {
        $subscribers = NewsletterSubscriber::latest()->paginate(20);
        $settings = NewsletterSetting::get();
        return view('admin.newsletter.index', compact('subscribers', 'settings'));
    }

    public function updateSettings(Request $request)
    {
        $validated = $request->validate([
            'enabled' => ['nullable', 'boolean'],
            'double_opt_in' => ['nullable', 'boolean'],
            'send_welcome_email' => ['nullable', 'boolean'],
            'provider' => ['required', 'in:local'],
        ]);

        $settings = NewsletterSetting::get();
        $settings->update([
            'enabled' => (bool) $request->boolean('enabled'),
            'double_opt_in' => (bool) $request->boolean('double_opt_in'),
            'send_welcome_email' => (bool) $request->boolean('send_welcome_email'),
            'provider' => 'local',
        ]);

        return back()->with('success', 'Newsletter settings updated.');
    }

    public function toggle(NewsletterSubscriber $subscriber)
    {
        $subscriber->status = $subscriber->status === 'subscribed' ? 'unsubscribed' : 'subscribed';
        if ($subscriber->status === 'subscribed') {
            $subscriber->subscribed_at = now();
        } else {
            $subscriber->unsubscribed_at = now();
        }
        $subscriber->save();

        return back()->with('success', 'Subscriber status updated.');
    }

    public function destroy(NewsletterSubscriber $subscriber)
    {
        $subscriber->delete();
        return back()->with('success', 'Subscriber removed.');
    }
}
