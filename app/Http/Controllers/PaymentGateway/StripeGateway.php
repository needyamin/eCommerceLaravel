<?php

namespace App\Http\Controllers\PaymentGateway;

use Stripe\Stripe;
use Stripe\PaymentIntent;
use Stripe\Refund;
use Stripe\Exception\ApiErrorException;

class StripeGateway extends BasePaymentGateway
{
    public function __construct()
    {
        parent::__construct();
        
        if ($this->isEnabled()) {
            Stripe::setApiKey($this->getConfigValue('secret_key'));
        }
    }

    /**
     * Get gateway name
     */
    public function getGatewayName(): string
    {
        return 'stripe';
    }

    /**
     * Process payment
     */
    public function processPayment(array $paymentData): array
    {
        try {
            $this->validatePaymentData($paymentData);
            
            if (!$this->isEnabled()) {
                throw new \Exception('Stripe payment gateway is not enabled');
            }

            $paymentIntent = PaymentIntent::create([
                'amount' => $this->convertToCents($paymentData['amount']),
                'currency' => strtolower($paymentData['currency']),
                'metadata' => [
                    'order_id' => $paymentData['order_id'],
                    'customer_email' => $paymentData['customer_email'] ?? '',
                ],
                'description' => "Order #{$paymentData['order_id']}",
            ]);

            $this->logActivity('payment_created', [
                'payment_intent_id' => $paymentIntent->id,
                'order_id' => $paymentData['order_id'],
                'amount' => $paymentData['amount'],
            ]);

            return [
                'success' => true,
                'payment_id' => $paymentIntent->id,
                'client_secret' => $paymentIntent->client_secret,
                'amount' => $paymentData['amount'],
                'currency' => $paymentData['currency'],
                'status' => $paymentIntent->status,
            ];

        } catch (ApiErrorException $e) {
            $this->logActivity('payment_error', [
                'error' => $e->getMessage(),
                'order_id' => $paymentData['order_id'] ?? null,
            ]);

            return [
                'success' => false,
                'error' => $e->getMessage(),
                'error_code' => $e->getStripeCode(),
            ];
        } catch (\Exception $e) {
            $this->logActivity('payment_error', [
                'error' => $e->getMessage(),
                'order_id' => $paymentData['order_id'] ?? null,
            ]);

            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Verify payment
     */
    public function verifyPayment(string $paymentId): array
    {
        try {
            if (!$this->isEnabled()) {
                throw new \Exception('Stripe payment gateway is not enabled');
            }

            $paymentIntent = PaymentIntent::retrieve($paymentId);

            $this->logActivity('payment_verified', [
                'payment_intent_id' => $paymentId,
                'status' => $paymentIntent->status,
            ]);

            return [
                'success' => true,
                'payment_id' => $paymentIntent->id,
                'status' => $paymentIntent->status,
                'amount' => $this->convertFromCents($paymentIntent->amount),
                'currency' => strtoupper($paymentIntent->currency),
                'paid' => $paymentIntent->status === 'succeeded',
            ];

        } catch (ApiErrorException $e) {
            $this->logActivity('verification_error', [
                'error' => $e->getMessage(),
                'payment_id' => $paymentId,
            ]);

            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Refund payment
     */
    public function refundPayment(string $paymentId, float $amount = null): array
    {
        try {
            if (!$this->isEnabled()) {
                throw new \Exception('Stripe payment gateway is not enabled');
            }

            $refundData = ['payment_intent' => $paymentId];
            
            if ($amount !== null) {
                $refundData['amount'] = $this->convertToCents($amount);
            }

            $refund = Refund::create($refundData);

            $this->logActivity('refund_created', [
                'refund_id' => $refund->id,
                'payment_intent_id' => $paymentId,
                'amount' => $amount,
            ]);

            return [
                'success' => true,
                'refund_id' => $refund->id,
                'amount' => $this->convertFromCents($refund->amount),
                'status' => $refund->status,
            ];

        } catch (ApiErrorException $e) {
            $this->logActivity('refund_error', [
                'error' => $e->getMessage(),
                'payment_id' => $paymentId,
            ]);

            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }

    /**
     * Convert amount to cents (Stripe uses cents)
     */
    private function convertToCents(float $amount): int
    {
        return (int) round($amount * 100);
    }

    /**
     * Convert amount from cents
     */
    private function convertFromCents(int $amount): float
    {
        return $amount / 100;
    }

    /**
     * Get webhook signature verification
     */
    public function verifyWebhook(string $payload, string $signature): bool
    {
        $endpointSecret = $this->getConfigValue('webhook_secret');
        
        if (!$endpointSecret) {
            return false;
        }

        try {
            \Stripe\Webhook::constructEvent($payload, $signature, $endpointSecret);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }
}
