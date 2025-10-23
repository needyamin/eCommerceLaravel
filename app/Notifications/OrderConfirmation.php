<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Models\Order;

class OrderConfirmation extends Notification implements ShouldQueue
{
    use Queueable;

    protected $order;

    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Order Confirmation - ' . $this->order->number)
            ->greeting('Hello ' . $this->order->billing_name . '!')
            ->line('Thank you for your order! We have received your order and are processing it.')
            ->line('Order Number: ' . $this->order->number)
            ->line('Order Total: $' . number_format($this->order->grand_total, 2))
            ->line('Order Status: ' . ucfirst($this->order->status))
            ->action('View Order', url('/orders/' . $this->order->id))
            ->line('We will send you another email when your order ships.')
            ->line('If you have any questions, please contact our support team.');
    }

    public function toArray($notifiable)
    {
        return [
            'order_id' => $this->order->id,
            'order_number' => $this->order->number,
            'total' => $this->order->grand_total,
        ];
    }
}