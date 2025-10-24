<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ShippingSetting;

class ShippingSettingsController extends Controller
{
    public function index()
    {
        $settings = ShippingSetting::get();
        return view('admin.shipping-settings.index', compact('settings'));
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'enabled' => ['sometimes','boolean'],
            'free_shipping_enabled' => ['sometimes','boolean'],
            'free_shipping_min_total' => ['required','numeric','min:0'],
            'country_rates' => ['nullable','array'],
        ]);
        // Normalize rates: array of {country, city?, type, amount}
        $normalized = [];
        foreach ((array) $request->input('country_rates', []) as $key => $conf) {
            if (!is_array($conf)) { continue; }
            $country = $conf['country'] ?? (is_string($key) ? $key : null);
            if (!$country) { continue; }
            $city = trim((string) ($conf['city'] ?? ''));
            $type = in_array(($conf['type'] ?? 'flat'), ['flat','percent'], true) ? $conf['type'] : 'flat';
            $amount = (float) ($conf['amount'] ?? 0);
            $normalized[] = [
                'country' => $country,
                'city' => $city,
                'type' => $type,
                'amount' => $amount,
            ];
        }
        $settings = ShippingSetting::get();
        $settings->update([
            'enabled' => $request->boolean('enabled'),
            'free_shipping_enabled' => $request->boolean('free_shipping_enabled'),
            'free_shipping_min_total' => $data['free_shipping_min_total'],
            'country_rates' => $normalized,
            'global_rate_enabled' => $request->boolean('global_rate_enabled'),
            'global_rate_type' => $request->input('global_rate_type', 'flat'),
            'global_rate_amount' => (float) $request->input('global_rate_amount', 0),
        ]);
        return back()->with('success', 'Shipping settings updated.');
    }
}


