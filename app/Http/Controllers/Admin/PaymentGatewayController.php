<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\PaymentGateway\PaymentGatewayManager;
use App\Models\PaymentGatewaySetting;
use App\Models\PaymentLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PaymentGatewayController extends Controller
{
    private $gatewayManager;

    public function __construct(PaymentGatewayManager $gatewayManager)
    {
        $this->gatewayManager = $gatewayManager;
    }

    /**
     * Display payment gateway settings
     */
    public function index()
    {
        $gateways = $this->gatewayManager->getAllGateways();
        $recentLogs = PaymentLog::getRecentLogs(20);
        
        return view('admin.payment-gateways.index', compact('gateways', 'recentLogs'));
    }

    /**
     * Show settings for a specific gateway
     */
    public function show(string $gateway)
    {
        if ($gateway === 'cod') {
            // Handle COD separately
            $settings = PaymentGatewaySetting::where('gateway', 'cod')->get();
            return view('admin.payment-gateways.show-cod', compact('settings'));
        }
        
        if (!$this->gatewayManager->hasGateway($gateway)) {
            return redirect()->route('admin.payment-gateways.index')
                ->with('error', 'Invalid payment gateway.');
        }

        $gatewayInstance = $this->gatewayManager->getGateway($gateway);
        $settings = PaymentGatewaySetting::where('gateway', $gateway)->get();
        $logs = PaymentLog::getGatewayLogs($gateway, 50);

        return view('admin.payment-gateways.show', compact('gateway', 'gatewayInstance', 'settings', 'logs'));
    }

    /**
     * Update gateway settings
     */
    public function update(Request $request, string $gateway)
    {
        if ($gateway === 'cod') {
            // Handle COD update
            $enabled = $request->boolean('enabled', true);
            PaymentGatewaySetting::setGatewaySetting(
                'cod',
                'enabled',
                $enabled,
                'Enable or disable Cash on Delivery payment method'
            );
            return redirect()->route('admin.payment-gateways.show', 'cod')
                ->with('success', 'Cash on Delivery settings updated successfully.');
        }
        
        if (!$this->gatewayManager->hasGateway($gateway)) {
            return redirect()->route('admin.payment-gateways.index')
                ->with('error', 'Invalid payment gateway.');
        }

        $gatewayInstance = $this->gatewayManager->getGateway($gateway);
        
        // Define validation rules based on gateway
        $rules = $this->getValidationRules($gateway);
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        try {
            // Update settings
            foreach ($request->all() as $key => $value) {
                if ($key !== '_token' && $key !== '_method') {
                    $isEncrypted = $this->isEncryptedField($gateway, $key);
                    PaymentGatewaySetting::setGatewaySetting(
                        $gateway,
                        $key,
                        $value,
                        $this->getFieldDescription($gateway, $key),
                        $isEncrypted
                    );
                }
            }

            return redirect()->route('admin.payment-gateways.show', $gateway)
                ->with('success', 'Payment gateway settings updated successfully.');

        } catch (\Exception $e) {
            return redirect()->back()
                ->with('error', 'Failed to update settings: ' . $e->getMessage())
                ->withInput();
        }
    }

    /**
     * Toggle gateway enabled status
     */
    public function toggleStatus(string $gateway)
    {
        if ($gateway === 'cod') {
            $currentStatus = (bool) PaymentGatewaySetting::where('gateway', 'cod')
                ->where('key', 'enabled')
                ->value('value') ?? true;
            $newStatus = !$currentStatus;
            
            PaymentGatewaySetting::setGatewaySetting(
                'cod',
                'enabled',
                $newStatus,
                'Enable or disable Cash on Delivery payment method'
            );
            
            $statusText = $newStatus ? 'enabled' : 'disabled';
            return redirect()->back()
                ->with('success', "Cash on Delivery has been {$statusText}.");
        }
        
        if (!$this->gatewayManager->hasGateway($gateway)) {
            return redirect()->route('admin.payment-gateways.index')
                ->with('error', 'Invalid payment gateway.');
        }

        $gatewayInstance = $this->gatewayManager->getGateway($gateway);
        $currentStatus = $gatewayInstance->isEnabled();
        $newStatus = !$currentStatus;

        PaymentGatewaySetting::setGatewaySetting(
            $gateway,
            'enabled',
            $newStatus,
            'Enable or disable this payment gateway'
        );

        $statusText = $newStatus ? 'enabled' : 'disabled';
        
        return redirect()->back()
            ->with('success', ucfirst($gateway) . " payment gateway has been {$statusText}.");
    }

    /**
     * Test gateway connection
     */
    public function testConnection(string $gateway)
    {
        if (!$this->gatewayManager->hasGateway($gateway)) {
            return response()->json(['success' => false, 'message' => 'Invalid payment gateway.']);
        }

        try {
            $gatewayInstance = $this->gatewayManager->getGateway($gateway);
            
            if (!$gatewayInstance->isEnabled()) {
                return response()->json(['success' => false, 'message' => 'Gateway is not enabled.']);
            }

            // Test with dummy data
            $testData = [
                'amount' => 1.00,
                'currency' => 'USD',
                'order_id' => 'test_' . time(),
                'customer_email' => 'test@example.com',
            ];

            $result = $gatewayInstance->processPayment($testData);
            
            if ($result['success']) {
                return response()->json([
                    'success' => true,
                    'message' => 'Connection test successful!',
                    'details' => $result
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Connection test failed: ' . ($result['error'] ?? 'Unknown error')
                ]);
            }

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Connection test failed: ' . $e->getMessage()
            ]);
        }
    }

    /**
     * Get validation rules for gateway
     */
    private function getValidationRules(string $gateway): array
    {
        $rules = [];

        switch ($gateway) {
            case 'stripe':
                $rules = [
                    'enabled' => 'boolean',
                    'publishable_key' => 'required_if:enabled,true|string|max:255',
                    'secret_key' => 'required_if:enabled,true|string|max:255',
                    'webhook_secret' => 'nullable|string|max:255',
                ];
                break;

            case 'paypal':
                $rules = [
                    'enabled' => 'boolean',
                    'client_id' => 'required_if:enabled,true|string|max:255',
                    'client_secret' => 'required_if:enabled,true|string|max:255',
                    'sandbox_mode' => 'boolean',
                ];
                break;
        }

        return $rules;
    }

    /**
     * Check if field should be encrypted
     */
    private function isEncryptedField(string $gateway, string $field): bool
    {
        $encryptedFields = [
            'stripe' => ['secret_key', 'webhook_secret'],
            'paypal' => ['client_secret'],
        ];

        return in_array($field, $encryptedFields[$gateway] ?? []);
    }

    /**
     * Get field description
     */
    private function getFieldDescription(string $gateway, string $field): string
    {
        $descriptions = [
            'stripe' => [
                'enabled' => 'Enable or disable Stripe payment gateway',
                'publishable_key' => 'Stripe publishable key (starts with pk_)',
                'secret_key' => 'Stripe secret key (starts with sk_)',
                'webhook_secret' => 'Stripe webhook endpoint secret',
            ],
            'paypal' => [
                'enabled' => 'Enable or disable PayPal payment gateway',
                'client_id' => 'PayPal application client ID',
                'client_secret' => 'PayPal application client secret',
                'sandbox_mode' => 'Use PayPal sandbox for testing',
            ],
        ];

        return $descriptions[$gateway][$field] ?? ucfirst(str_replace('_', ' ', $field));
    }
}