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
            'flat_rate' => ['nullable','numeric','min:0'],
            'free_shipping_enabled' => ['sometimes','boolean'],
            'free_shipping_min_total' => ['required','numeric','min:0'],
            'division_rates' => ['nullable','array'],
            'district_rates' => ['nullable','array'],
            'tax_enabled' => ['sometimes','boolean'],
            'tax_type' => ['nullable','in:flat,percent'],
            'tax_rate' => ['nullable','numeric','min:0'],
        ]);
        
        // Normalize division rates: array of {division, type, amount}
        $normalizedDivision = [];
        $divisionRates = (array) $request->input('division_rates', []);
        
        // Handle case where form sends separate array items instead of grouped objects
        // Reconstruct grouped items from sequential array entries
        $groupedDivision = [];
        $currentIndex = 0;
        
        foreach ($divisionRates as $conf) {
            if (!is_array($conf)) { continue; }
            
            // If this entry has a division, it's the start of a new group
            if (isset($conf['division']) && !empty($conf['division'])) {
                $currentIndex = count($groupedDivision);
                $groupedDivision[$currentIndex] = $conf;
            } else {
                // Otherwise, merge into the current group
                if (!isset($groupedDivision[$currentIndex])) {
                    $groupedDivision[$currentIndex] = [];
                }
                $groupedDivision[$currentIndex] = array_merge($groupedDivision[$currentIndex], $conf);
            }
        }
        
        foreach ($groupedDivision as $conf) {
            if (!is_array($conf)) { continue; }
            $division = trim((string) ($conf['division'] ?? ''));
            if (!$division) { continue; }
            $type = isset($conf['type']) && in_array($conf['type'], ['flat','percent'], true) ? $conf['type'] : 'flat';
            $amount = (float) ($conf['amount'] ?? 0);
            $normalizedDivision[] = [
                'division' => $division,
                'type' => $type,
                'amount' => $amount,
            ];
        }
        
        // Normalize district rates: array of {district, type, amount}
        $normalizedDistrict = [];
        $districtRates = (array) $request->input('district_rates', []);
        
        // Handle case where form sends separate array items instead of grouped objects
        $groupedDistrict = [];
        $currentIndex = 0;
        
        foreach ($districtRates as $conf) {
            if (!is_array($conf)) { continue; }
            
            // If this entry has a district, it's the start of a new group
            if (isset($conf['district']) && !empty($conf['district'])) {
                $currentIndex = count($groupedDistrict);
                $groupedDistrict[$currentIndex] = $conf;
            } else {
                // Otherwise, merge into the current group
                if (!isset($groupedDistrict[$currentIndex])) {
                    $groupedDistrict[$currentIndex] = [];
                }
                $groupedDistrict[$currentIndex] = array_merge($groupedDistrict[$currentIndex], $conf);
            }
        }
        
        foreach ($groupedDistrict as $conf) {
            if (!is_array($conf)) { continue; }
            $district = trim((string) ($conf['district'] ?? ''));
            if (!$district) { continue; }
            $type = isset($conf['type']) && in_array($conf['type'], ['flat','percent'], true) ? $conf['type'] : 'flat';
            $amount = (float) ($conf['amount'] ?? 0);
            $normalizedDistrict[] = [
                'district' => $district,
                'type' => $type,
                'amount' => $amount,
            ];
        }
        
        $settings = ShippingSetting::get();
        $settings->update([
            'enabled' => $request->boolean('enabled'),
            'flat_rate' => (float) ($request->input('flat_rate', 0)),
            'free_shipping_enabled' => $request->boolean('free_shipping_enabled'),
            'free_shipping_min_total' => $data['free_shipping_min_total'],
            'division_rates' => $normalizedDivision,
            'district_rates' => $normalizedDistrict,
            'tax_enabled' => $request->boolean('tax_enabled'),
            'tax_type' => $request->input('tax_type', 'percent'),
            'tax_rate' => (float) ($request->input('tax_rate', 0)),
        ]);
        return back()->with('success', 'Shipping & tax settings updated.');
    }
}


