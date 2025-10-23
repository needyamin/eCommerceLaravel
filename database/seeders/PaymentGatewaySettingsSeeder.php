<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\PaymentGatewaySetting;

class PaymentGatewaySettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Stripe Settings
        PaymentGatewaySetting::setGatewaySetting('stripe', 'enabled', false, 'Enable or disable Stripe payment gateway');
        PaymentGatewaySetting::setGatewaySetting('stripe', 'publishable_key', '', 'Stripe publishable key (starts with pk_)');
        PaymentGatewaySetting::setGatewaySetting('stripe', 'secret_key', '', 'Stripe secret key (starts with sk_)', true);
        PaymentGatewaySetting::setGatewaySetting('stripe', 'webhook_secret', '', 'Stripe webhook endpoint secret', true);

        // PayPal Settings
        PaymentGatewaySetting::setGatewaySetting('paypal', 'enabled', false, 'Enable or disable PayPal payment gateway');
        PaymentGatewaySetting::setGatewaySetting('paypal', 'client_id', '', 'PayPal application client ID');
        PaymentGatewaySetting::setGatewaySetting('paypal', 'client_secret', '', 'PayPal application client secret', true);
        PaymentGatewaySetting::setGatewaySetting('paypal', 'sandbox_mode', true, 'Use PayPal sandbox for testing');
    }
}