<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\Admin\Auth\LoginController as AdminLoginController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboardController;
use App\Http\Controllers\Admin\CategoryController as AdminCategoryController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\ThemeController as AdminThemeController;
use App\Http\Controllers\Admin\RoleController as AdminRoleController;
use App\Http\Controllers\Admin\PermissionController as AdminPermissionController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Admin\UserController as AdminUserController;
use App\Http\Controllers\Admin\EmailSettingsController as AdminEmailSettingsController;
use App\Http\Controllers\Admin\CouponController as AdminCouponController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\NewsletterController as FrontNewsletterController;
use App\Http\Controllers\CurrencyController;
use App\Http\Controllers\OTP\SmsOtpController;
use App\Http\Controllers\OTP\EmailOtpController;

Route::get('/', [HomeController::class, 'index'])->name('home');

// Currency switch (locked to admin only)
Route::middleware('auth:admin')->post('/currency/switch', [CurrencyController::class, 'switch'])->name('currency.switch');

// OTP routes (public endpoints for demo)
Route::post('/otp/request-email', [EmailOtpController::class, 'request'])->name('otp.request.email');
Route::post('/otp/verify-email', [EmailOtpController::class, 'verify'])->name('otp.verify.email');
Route::post('/otp/request-sms', [SmsOtpController::class, 'request'])->name('otp.request.sms');
Route::post('/otp/verify-sms', [SmsOtpController::class, 'verify'])->name('otp.verify.sms');
Route::view('/otp/email', 'auth.otp.email')->name('otp.form.email');
Route::view('/otp/sms', 'auth.otp.sms')->name('otp.form.sms');

// Authentication Routes
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::get('/r/{code}', function ($code) {
    session(['referral_code' => $code]);
    return redirect()->route('register');
})->name('referral');
Route::get('/r', function () {
    return redirect()->route('register');
});
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

    // Newsletter (public)
    Route::post('/newsletter/subscribe', [FrontNewsletterController::class, 'subscribe'])->name('newsletter.subscribe');
    Route::post('/newsletter/unsubscribe', [FrontNewsletterController::class, 'unsubscribe'])->name('newsletter.unsubscribe');
    Route::get('/newsletter/confirm/{token}', [FrontNewsletterController::class, 'confirm'])->name('newsletter.confirm');

// User Profile Routes
Route::middleware('auth')->group(function () {
    Route::get('/profile', [AuthController::class, 'showProfile'])->name('profile');
    Route::put('/profile', [AuthController::class, 'updateProfile'])->name('profile.update');
    Route::put('/profile/password', [AuthController::class, 'changePassword'])->name('profile.change-password');
    
    // Address Management
    Route::resource('addresses', AddressController::class);
    Route::post('/addresses/{address}/set-default', [AddressController::class, 'setDefault'])->name('addresses.set-default');
});

// Products and categories
Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/{slug}', [ProductController::class, 'show'])->name('products.show');
Route::get('/category/{slug}', [CategoryController::class, 'show'])->name('categories.show');

// Cart
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::post('/cart/add', [CartController::class, 'add'])->name('cart.add');
Route::put('/cart/items/{item}', [CartController::class, 'update'])->name('cart.items.update');
Route::delete('/cart/items/{item}', [CartController::class, 'remove'])->name('cart.items.remove');
Route::post('/cart/clear', [CartController::class, 'clear'])->name('cart.clear');

// Coupons
Route::post('/coupons/apply', [CouponController::class, 'apply'])->name('coupons.apply');
Route::post('/coupons/remove', [CouponController::class, 'remove'])->name('coupons.remove');
Route::post('/coupons/validate', [CouponController::class, 'validate'])->name('coupons.validate');

// Test route for debugging
Route::get('/test-coupon', function() {
    return view('test-coupon');
})->name('test-coupon');

// Checkout and Orders
Route::get('/checkout', [CheckoutController::class, 'show'])->name('checkout.show');
Route::post('/checkout', [CheckoutController::class, 'place'])->name('checkout.place');

Route::middleware('auth')->group(function(){
    Route::get('/orders', [OrderController::class, 'index'])->name('orders.index');
    Route::get('/orders/{id}', [OrderController::class, 'show'])->name('orders.show');
});
// Guest order view via signed URL (no auth)
Route::get('/order/guest/{order}', [OrderController::class, 'showGuest'])
    ->name('orders.guest.show')
    ->middleware('signed');

// Admin routes
// Public theme previews (e.g., login/register pages)
Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('/theme/{path?}', [AdminThemeController::class, 'show'])->where('path', '.*')->name('theme');
});

Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('/login', [AdminLoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [AdminLoginController::class, 'login'])->name('login.attempt');
    Route::post('/logout', [AdminLoginController::class, 'logout'])->name('logout');

    Route::middleware(['auth:admin','admin.permission'])->group(function () {
        Route::get('/', [AdminDashboardController::class, 'index'])->name('dashboard');
        Route::resource('categories', AdminCategoryController::class);
        Route::resource('products', AdminProductController::class);
        Route::resource('orders', AdminOrderController::class)->only(['index', 'show', 'update']);
        Route::resource('users', AdminUserController::class)->except(['create', 'store']);
        Route::post('users/{user}/reset-password', [AdminUserController::class, 'resetPassword'])->name('users.reset-password');
        Route::post('users/{user}/toggle-status', [AdminUserController::class, 'toggleStatus'])->name('users.toggle-status');
        Route::post('users/{user}/coins/adjust', [AdminUserController::class, 'adjustCoins'])->name('users.coins.adjust');
        Route::post('users/{user}/coins/reset', [AdminUserController::class, 'resetCoins'])->name('users.coins.reset');
        Route::get('shipping-settings', [\App\Http\Controllers\Admin\ShippingSettingsController::class, 'index'])->name('shipping-settings.index');
        Route::put('shipping-settings', [\App\Http\Controllers\Admin\ShippingSettingsController::class, 'update'])->name('shipping-settings.update');
        Route::get('email-settings', [AdminEmailSettingsController::class, 'index'])->name('email-settings.index');
        Route::put('email-settings', [AdminEmailSettingsController::class, 'update'])->name('email-settings.update');
            Route::resource('roles', AdminRoleController::class)->except(['show']);
            Route::resource('permissions', AdminPermissionController::class)->except(['show']);
            Route::resource('coupons', AdminCouponController::class);
            Route::post('coupons/{coupon}/toggle-status', [AdminCouponController::class, 'toggleStatus'])->name('coupons.toggle-status');

            // Newsletter admin
            Route::get('newsletter', [App\Http\Controllers\Admin\NewsletterController::class, 'index'])->name('newsletter.index');
            Route::put('newsletter/settings', [App\Http\Controllers\Admin\NewsletterController::class, 'updateSettings'])->name('newsletter.settings.update');
            Route::post('newsletter/{subscriber}/toggle', [App\Http\Controllers\Admin\NewsletterController::class, 'toggle'])->name('newsletter.toggle');
            Route::delete('newsletter/{subscriber}', [App\Http\Controllers\Admin\NewsletterController::class, 'destroy'])->name('newsletter.destroy');
            
            // Payment Gateways
            Route::get('payment-gateways', [App\Http\Controllers\Admin\PaymentGatewayController::class, 'index'])->name('payment-gateways.index');
            Route::get('payment-gateways/{gateway}', [App\Http\Controllers\Admin\PaymentGatewayController::class, 'show'])->name('payment-gateways.show');
            Route::put('payment-gateways/{gateway}', [App\Http\Controllers\Admin\PaymentGatewayController::class, 'update'])->name('payment-gateways.update');
            Route::post('payment-gateways/{gateway}/toggle-status', [App\Http\Controllers\Admin\PaymentGatewayController::class, 'toggleStatus'])->name('payment-gateways.toggle-status');
            Route::post('payment-gateways/{gateway}/test', [App\Http\Controllers\Admin\PaymentGatewayController::class, 'testConnection'])->name('payment-gateways.test');

            // OTP Settings
            Route::get('otp-settings', [App\Http\Controllers\Admin\OtpSettingsController::class, 'index'])->name('otp-settings.index');
            Route::put('otp-settings', [App\Http\Controllers\Admin\OtpSettingsController::class, 'update'])->name('otp-settings.update');

            // Currencies
            Route::resource('currencies', App\Http\Controllers\Admin\CurrencyController::class)->except(['show']);
            Route::post('currencies/{currency}/toggle', [App\Http\Controllers\Admin\CurrencyController::class, 'toggle'])->name('currencies.toggle');
            Route::post('currencies/{currency}/default', [App\Http\Controllers\Admin\CurrencyController::class, 'setDefault'])->name('currencies.default');

            // Site Settings
            Route::get('site-settings', [App\Http\Controllers\Admin\SiteSettingsController::class, 'index'])->name('site-settings.index');
            Route::put('site-settings', [App\Http\Controllers\Admin\SiteSettingsController::class, 'update'])->name('site-settings.update');

            // Administrators
            Route::resource('admins', App\Http\Controllers\Admin\AdminController::class)->except(['show']);

            // Coin Settings
            Route::get('coin-settings', [App\Http\Controllers\Admin\CoinSettingsController::class, 'index'])->name('coin-settings.index');
            Route::put('coin-settings', [App\Http\Controllers\Admin\CoinSettingsController::class, 'update'])->name('coin-settings.update');
    });
});
