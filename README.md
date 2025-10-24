# 🛒 Laravel eCommerce System

A comprehensive, modern eCommerce platform built with Laravel 11, featuring a beautiful storefront and powerful admin panel with role-based access control.

![Laravel](https://img.shields.io/badge/Laravel-11.x-red.svg)
![PHP](https://img.shields.io/badge/PHP-8.2+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## ✨ Features

### 🛍️ **Storefront**
- **Product Catalog**: Browse products by categories with advanced filtering & sorting
- **Shopping Cart (AJAX)**: Add to cart, inline increase/decrease, and remove without page reload; live header count
- **Coupons**: Apply/remove coupons (AJAX) with discount reflected in totals
- **Checkout Process**: Secure checkout with validation and order creation, email notification
- **Currency Switcher**: Session-based currency with @currency formatting across pages
- **Responsive Design**: Mobile-first Bootstrap 5 UI (storefront) with modern components
- **User Authentication**: Login, register, profile update, password change

### 🔧 **Admin Panel**
- **Dashboard**: Stats and quick access; Bootstrap 5 navbar/cards
- **Products/Categories**: Full CRUD with images, hierarchical categories
- **Orders**: Index/show/update status
- **Roles/Permissions**: Spatie permissions with route-based checks
- **Payment Gateways**: Stripe/PayPal configure, enable/disable, test connection; logs
- **Currencies**: CRUD, set default/toggle active, rates & formatting
- **Newsletter**: Subscribers list, status toggle/remove; frontend subscribe forms
- **OTP Settings**: Enable Email/SMS OTP, length, TTL, attempts, SMS gateway/API fields
- **Email Settings**: Admin-managed SMTP (mailer/host/port/user/pass/encryption/from) applied at runtime

### 🔐 **Security & Authorization**
- **Role-Based Access Control (RBAC)**: Using Spatie Laravel Permission
- **Route-Based Permissions**: Individual permissions for each admin route
- **User Authorization**: Users can only access their own orders and data
- **CSRF Protection**: Built-in Laravel security features
- **Input Validation**: Comprehensive form validation and sanitization

### 📊 **Technical Features**
- **Eloquent ORM**: Clean, expressive database interactions
- **Database Migrations**: Version-controlled database schema
- **Model Factories**: Automated test data generation
- **Pagination**: Efficient data loading with Bootstrap 5 pagination
- **API Ready**: RESTful API endpoints for mobile app integration
- **Session Management**: Secure cart and user session handling

## 🚀 Why Use This eCommerce System?

### **For Developers**
- **Clean Architecture**: Follows Laravel best practices and MVC pattern
- **Extensible**: Easy to add new features and customize functionality
- **Well Documented**: Comprehensive code comments and structure
- **Modern Stack**: Built with latest Laravel 11 and PHP 8.2+
- **Security First**: Implements industry-standard security practices

### **For Business Owners**
- **Complete Solution**: Everything needed to start selling online
- **Professional Design**: Modern, responsive interface that builds trust
- **Easy Management**: Intuitive admin panel for non-technical users
- **Scalable**: Built to handle growth from startup to enterprise
- **Cost Effective**: Open source solution with no licensing fees

### **For Customers**
- **Fast Performance**: Optimized for speed and user experience
- **Mobile Friendly**: Perfect shopping experience on all devices
- **Secure Checkout**: Safe and reliable payment processing
- **Order Tracking**: Complete visibility into order status and history

## 📋 Requirements

- **PHP**: 8.2 or higher
- **Composer**: Latest version
- **Database**: MySQL, PostgreSQL, or SQLite
- **Web Server**: Apache, Nginx, or Laravel Valet
- **Node.js**: For asset compilation (optional)

## 🛠️ Installation

### 1. Clone the Repository
```bash
git clone https://github.com/needyamin/eCommerceLaravel
cd laravel-ecommerce
```

### 2. Install Dependencies
```bash
composer install
npm install
```

### 3. Environment Setup
```bash
cp .env.example .env
php artisan key:generate
```

### 4. Database Configuration
Update your `.env` file with database credentials:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ecommerce_laravel
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

### 5. Run Migrations and Seeders
```bash
php artisan migrate --seed
```

### 6. Compile Assets (Optional)
```bash
npm run dev
# or for production
npm run build
```

### 7. Start the Server
```bash
php artisan serve
```

Visit `http://localhost:8000` to see your eCommerce store!

## 👤 Default Accounts

### Admin Account
- **Email**: `admin@example.com`
- **Password**: `password`
- **Role**: Super Admin (full access)

### Test User Account
- **Email**: `test@example.com`
- **Password**: `password`

## 📁 Project Structure

```
├── app/
│   ├── Http/Controllers/
│   │   ├── Admin/           # Admin panel controllers
│   │   └── Api/             # API controllers
│   ├── Models/              # Eloquent models
│   └── Providers/           # Service providers
├── database/
│   ├── migrations/          # Database schema
│   ├── seeders/             # Sample data
│   └── factories/           # Model factories
├── resources/
│   ├── views/
│   │   ├── admin/           # Admin panel views
│   │   ├── layouts/         # Layout templates
│   │   └── ...             # Frontend views
│   └── css/                # Stylesheets
├── routes/
│   ├── web.php             # Web routes
│   └── api.php             # API routes
└── public/
    └── admin-assets/       # Admin theme assets
```

## 🔧 Configuration

### Admin Panel Customization
The admin panel uses AdminLTE theme. Customize the appearance by modifying:
- `resources/views/admin/layouts/app.blade.php`
- `resources/views/admin/partials/sidebar.blade.php`
- `public/admin-assets/css/adminlte.css`

### Permission System
Add new permissions by updating the `DatabaseSeeder.php`:
```php
$permissions = [
    'admin.your-feature.index',
    'admin.your-feature.create',
    // ... more permissions
];
```

### Email Configuration
You can configure SMTP at runtime from Admin → Email Settings (no .env edit required). For local setup via `.env`, use:
```env
MAIL_MAILER=smtp
MAIL_HOST=your-smtp-host
MAIL_PORT=587
MAIL_USERNAME=your-email
MAIL_PASSWORD=your-password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=no-reply@example.com
MAIL_FROM_NAME="Your Store"
```

## 📚 API Documentation

The system includes RESTful API endpoints for mobile app integration:

### Authentication
- `POST /api/register` - User registration
- `POST /api/login` - User login
- `POST /api/logout` - User logout

### Products & Categories
- `GET /api/categories` - List categories
- `GET /api/products` - List products
- `GET /api/products/{id}` - Get product details

### Cart & Orders
- `GET /api/cart` - Get user cart
- `POST /api/cart/add` - Add item to cart
- `GET /api/orders` - List user orders
- `GET /api/orders/{id}` - Get order details

### OTP
- Email & SMS OTP request/verify endpoints (UI available under `/otp/email` and `/otp/sms`)

## 🧪 Testing

Run the test suite:
```bash
php artisan test
```

Generate test data:
```bash
php artisan db:seed --class=DatabaseSeeder
```

## 🚀 Deployment

### Production Deployment
1. Set `APP_ENV=production` in `.env`
2. Run `php artisan config:cache`
3. Run `php artisan route:cache`
4. Run `php artisan view:cache`
5. Set up proper web server configuration
6. Configure SSL certificate
7. Set up database backups

### Docker Deployment
```bash
docker-compose up -d
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Laravel](https://laravel.com) - The PHP framework
- [AdminLTE](https://adminlte.io) - Admin panel theme
- [Spatie Laravel Permission](https://spatie.be/docs/laravel-permission) - Role and permission management
- [Tailwind CSS](https://tailwindcss.com) - CSS framework

## 📞 Support

For support, email support@yourcompany.com or create an issue on GitHub.

---

**Built with ❤️ using Laravel 11**
