<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Admin;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RoutesSmokeTest extends TestCase
{
    // use RefreshDatabase; // optional for CI speed

    public function test_public_pages_load(): void
    {
        $this->get('/')->assertStatus(200);
        $this->get('/products')->assertStatus(200);
        $this->get('/test-coupon')->assertStatus(200);
    }

    public function test_auth_pages_render(): void
    {
        $this->get('/login')->assertStatus(200);
        $this->get('/register')->assertStatus(200);
    }

    public function test_cart_checkout_pages(): void
    {
        $this->get('/cart')->assertStatus(200);
        $this->get('/checkout')->assertStatus(302); // redirects when empty cart
    }

    public function test_profile_requires_auth(): void
    {
        $this->get('/profile')->assertRedirect('/login');
    }

    public function test_admin_login_render(): void
    {
        $this->get('/admin/login')->assertStatus(200);
    }

    public function test_admin_routes_require_guard(): void
    {
        $this->get('/admin')->assertRedirect('/admin/login');
        $this->get('/admin/site-settings')->assertRedirect('/admin/login');
    }
}


