# 🛒 Laravel eCommerce System

A comprehensive, modern eCommerce platform built with Laravel 12, featuring a beautiful storefront and powerful admin panel with role-based access control.

![Laravel](https://img.shields.io/badge/Laravel-12.x-red.svg)
![PHP](https://img.shields.io/badge/PHP-8.3+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## ✨ Key Features

### Storefront
- Product catalog with categories and subcategories
- Live search, shopping cart, wishlist
- Checkout with Bangladeshi address system (Division, District, Upazila)
- Payment gateways: bKash, Nagad, Rocket, SSL Commerce, Stripe, PayPal, COD
- Product reviews, ratings, and newsletter
- Coins (loyalty points) system
- Responsive Bootstrap 5 design

### Admin Panel
- Dashboard with analytics
- Products & Categories (with subcategories support)
- Orders, Users, Roles & Permissions
- Payment Gateway management
- Shipping & Tax settings (Bangladeshi divisions/districts)
- Email & SMS OTP settings
- Server-side DataTables for performance

## 📋 Requirements

- PHP 8.3+
- Composer
- MySQL/PostgreSQL/SQLite
- Node.js (optional, for asset compilation)

## 🛠️ Installation

1. **Clone and install dependencies:**
```bash
git clone https://github.com/needyamin/eCommerceLaravel
cd eCommerceLaravel
composer install
npm install
```

2. **Environment setup:**
```bash
cp .env.example .env
php artisan key:generate
```

3. **Configure database in `.env`:**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ecommerce_laravel
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

4. **Run migrations and seeders:**
```bash
php artisan migrate --seed
```

5. **Start server:**
```bash
php artisan serve
```

Visit `http://localhost:8000`

## 👤 Default Accounts

- **Admin**: `admin@example.com` / `password`
- **User**: `test@example.com` / `password`

## 📚 API Documentation

RESTful API for mobile app integration. Full documentation: `documentation/api_documentation.html`

### Key Endpoints

**Authentication:**
- `POST /api/register` - Register user
- `POST /api/login` - Login
- `GET /api/user` - Get profile
- `PUT /api/user` - Update profile

**Products & Categories:**
- `GET /api/products` - List products (supports `q`, `category_id`, `per_page`)
- `GET /api/products/{slug}` - Product details
- `GET /api/categories` - List categories (supports `parent_only`, `subcategories_only`)
- `GET /api/categories/{slug}` - Category with subcategories

**Cart & Orders:**
- `GET /api/cart` - Get cart (guest: use `X-Cart-Session` header)
- `POST /api/cart/add` - Add to cart
- `POST /api/checkout` - Place order (requires: `billing_name`, `billing_email`, `billing_phone`, `gateway`, optional: `billing_division`, `billing_district`, `billing_upazila`)
- `GET /api/orders` - List orders
- `GET /api/orders/{id}` - Order details

**Addresses:**
- `GET /api/user/addresses` - List addresses
- `POST /api/user/addresses` - Create address (fields: `division`, `district`, `upazila`, `city`, `state`, etc.)
- `PUT /api/user/addresses/{address}` - Update address
- `DELETE /api/user/addresses/{address}` - Delete address

**Authentication:** Use `Authorization: Bearer {token}` header for protected endpoints.

**Guest Sessions:** Use `X-Cart-Session` and `X-Wishlist-Session` headers for guest operations.

## 💳 Payment Gateways

Configure from Admin → Payment Gateways:
- **bKash** - Mobile banking (Tokenized Checkout API)
- **Nagad** - Mobile banking
- **Rocket** - Mobile banking
- **SSL Commerce** - Card payments
- **Stripe** - Card payments
- **PayPal** - Online payments
- **Cash on Delivery (COD)**

All gateways support sandbox/test mode for testing.

## 🚚 Shipping & Tax

Configure from Admin → Shipping Settings:
- Enable/disable shipping
- Free shipping threshold
- Division-based rates (flat or percentage)
- District-based rates (flat or percentage)
- Tax settings (flat or percentage)
- Default currency: BDT (৳)

## 📧 Email & SMS

- **Email Settings**: Admin → Email Settings (SMTP configuration with cPanel auto-detection)
- **OTP Settings**: Admin → OTP Settings (Email & SMS OTP with multiple SMS providers)

## 🔧 Configuration

- **Site Settings**: Admin → Site Settings (SEO, social links, feature toggles)
- **Payment Gateways**: Admin → Payment Gateways
- **Shipping Settings**: Admin → Shipping Settings
- **Email Settings**: Admin → Email Settings
- **OTP Settings**: Admin → OTP Settings

## 📄 License

MIT License - see [LICENSE](LICENSE) file

## 📞 Support

Email: needyain@gmail.com or create an issue on GitHub.

---

**Built with ❤️ using Laravel 12**
