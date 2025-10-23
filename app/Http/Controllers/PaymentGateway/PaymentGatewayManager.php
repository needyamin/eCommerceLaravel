<?php

namespace App\Http\Controllers\PaymentGateway;

class PaymentGatewayManager
{
    private $gateways = [];

    public function __construct()
    {
        $this->registerGateways();
    }

    /**
     * Register available payment gateways
     */
    private function registerGateways()
    {
        $this->gateways = [
            'stripe' => StripeGateway::class,
            'paypal' => PayPalGateway::class,
        ];
    }

    /**
     * Get payment gateway instance
     */
    public function getGateway(string $name): ?PaymentGatewayInterface
    {
        if (!isset($this->gateways[$name])) {
            return null;
        }

        $gatewayClass = $this->gateways[$name];
        return new $gatewayClass();
    }

    /**
     * Get all available gateways
     */
    public function getAllGateways(): array
    {
        $availableGateways = [];
        
        foreach ($this->gateways as $name => $class) {
            $gateway = new $class();
            $availableGateways[$name] = [
                'name' => $name,
                'display_name' => ucfirst($name),
                'enabled' => $gateway->isEnabled(),
                'config' => $gateway->getConfig(),
            ];
        }
        
        return $availableGateways;
    }

    /**
     * Get enabled gateways only
     */
    public function getEnabledGateways(): array
    {
        $enabledGateways = [];
        
        foreach ($this->gateways as $name => $class) {
            $gateway = new $class();
            if ($gateway->isEnabled()) {
                $enabledGateways[$name] = [
                    'name' => $name,
                    'display_name' => ucfirst($name),
                    'config' => $gateway->getConfig(),
                ];
            }
        }
        
        return $enabledGateways;
    }

    /**
     * Check if gateway exists
     */
    public function hasGateway(string $name): bool
    {
        return isset($this->gateways[$name]);
    }

    /**
     * Get gateway names
     */
    public function getGatewayNames(): array
    {
        return array_keys($this->gateways);
    }
}
