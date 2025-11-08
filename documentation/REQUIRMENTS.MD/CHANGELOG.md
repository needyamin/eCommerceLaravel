# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-11-08

### Added
- Complete eCommerce storefront with modern Bootstrap 5 design
- Comprehensive admin panel with role-based access control
- Product catalog with categories, images, and advanced filtering
- Shopping cart with AJAX functionality (add, update, remove)
- Checkout process with multiple payment gateways (Stripe, PayPal, COD)
- User authentication and profile management
- Product reviews and ratings system
- Newsletter subscription with double opt-in
- Wishlist functionality (authenticated and guest users)
- Coupon/discount code system
- Multi-currency support with admin management
- Loyalty points (coins) system with referral program
- Shipping settings with per-country/city rates
- Custom pages management (Help Center, Shipping Info, etc.)
- Email OTP and SMS OTP verification
- Admin-managed SMTP email settings
- Server-side DataTables for efficient data management
- Custom CAPTCHA system for admin login security
- RESTful API for mobile app integration
- User activity tracking (cart, wishlist, sessions)
- Order management with invoice generation
- Site settings for comprehensive configuration
- Responsive design for mobile and desktop
- Live product search with AJAX
- Role and permission management with copy feature
- Parent category display on category and product pages

### Security
- CSRF protection on all forms
- XSS protection with proper input sanitization
- SQL injection prevention via Eloquent ORM
- Custom CAPTCHA for admin login
- Role-based access control for admin panel
- Secure password hashing
- Session security

### Technical
- Built with Laravel 12
- PHP 8.3+ compatibility
- MySQL/PostgreSQL/SQLite database support
- Docker deployment support
- Server-side processing for large datasets
- Eager loading for optimized queries
- Comprehensive API documentation

