# 🛒 Laravel eCommerce System

A comprehensive, modern eCommerce platform built with Laravel 12, featuring a beautiful storefront and powerful admin panel with role-based access control.

![Laravel](https://img.shields.io/badge/Laravel-12.x-red.svg)
![PHP](https://img.shields.io/badge/PHP-8.3+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)


<img width="1920" height="2136" alt="Image" src="https://github.com/user-attachments/assets/94ea9511-55c5-4a86-8769-f1405d0fffe2" />

## ✨ Features

### 🛍️ **Storefront**
- **Product Catalog**: Browse products by categories with advanced filtering & sorting
- **Live Search**: Real-time product search with dropdown results (triggers after 3 characters, shows up to 20 products with images, prices, categories, and stock status)
- **Shopping Cart (AJAX)**: Add to cart, inline increase/decrease, and remove without page reload; live header count
- **Coupons**: Apply/remove coupons (AJAX) with discount reflected in totals
- **Checkout Process**: Secure checkout with validation and order creation, email notification; default country selection (Bangladesh)
- **Payment Methods**: Stripe, PayPal, and Cash on Delivery (COD) - all configurable from admin panel
- **Currency**: Default currency enforced globally via `@currency(...)` (frontend switching disabled)
- **Coins (Loyalty Points)**: Earn coins for add‑to‑cart, order placement, COD choice, and referral sign‑ups. Balance shown on profile; admin can adjust/reset.
- **Product Reviews & Ratings**: Customers can leave reviews with ratings (1-5 stars), verified purchase badges, and admin moderation
- **Newsletter**: Email subscription system with double opt-in support and welcome emails
- **Pages System**: Customizable content pages (Help Center, Shipping Info, Returns, Contact Us) with rich text editor
- **Wishlist**: Add products to wishlist (supports both authenticated users and guests)
- **Responsive Design**: Mobile-first Bootstrap 5 UI (storefront) with modern components
- **Custom Error Pages**: Beautiful, animated error pages (404, 500, 403, 401, 503, 429) with gradient backgrounds, floating animations, and helpful action buttons
- **Schema.org Structured Data**: Automatic JSON-LD structured data for better SEO, rich snippets, and search engine understanding (Organization, Product, Reviews, Breadcrumbs)
- **Dynamic Sitemap**: Auto-generated XML sitemap at `/sitemap.xml` for search engines with configurable priorities and change frequencies
- **User Authentication**: Login, register, profile update, password change
- **User Profile**: View orders, addresses, reviews, and coin balance

### 🔧 **Admin Panel**
- **Dashboard**: Stats tiles + 14‑day Orders/Revenue charts; Recent Orders; Low Stock
- **Products/Categories**: Full CRUD with images, hierarchical categories, rich text editor for descriptions
- **Orders**: Index/show/update; colored badges for Status/Payment/Shipping
- **Users**: View user details, orders, cart items, wishlist, sessions; adjust/reset coins
- **Roles/Permissions**: Spatie permissions with route‑based checks; route permissions auto-listed
- **Administrators**: Manage admin users and assign roles (Admin → Administrators)
- **Pages Management**: CRUD for custom pages (Help Center, Shipping Info, Returns, Contact Us) with rich text editor
- **Reviews Management**: Approve/reject/delete product reviews; filter by status (server-side DataTables)
- **Newsletter Subscribers**: Manage newsletter subscribers, toggle subscription status
- **User Activity Tracking**: Monitor cart activity, wishlist activity (user & guest), and login sessions with server-side DataTables
- **Site Settings**: Comprehensive settings including:
  - Basic site information (name, tagline, logo, favicon)
  - SEO settings (meta title, description, keywords)
  - Legal & footer links (privacy, terms, cookies, customer service links)
  - Social media links
  - Feature toggles (wishlist, reviews, newsletter)
  - Review settings (enable/disable, require purchase, require approval, allow anonymous)
  - Newsletter settings (enable/disable, double opt-in, welcome email)
  - Product display settings (mobile and desktop columns per row)
  - Schema.org settings (enable/disable, organization details, structured data configuration)
  - Sitemap settings (enable/disable, priorities, change frequencies)
- **Payment Gateways**: Stripe/PayPal/COD configure, enable/disable, test connection; logs
- **Currencies**: CRUD, set default/toggle active, rates & formatting
- **Email Settings**: Admin-managed SMTP applied at runtime
- **Coin Settings**: Configure coin awards (add‑to‑cart award + daily cap, order award rate/minimum, COD bonus, referral signup bonus) and enable/disable features
- **Shipping Settings**: Enable/disable shipping, free‑shipping threshold, per‑country/city rates (flat/percent), global fallback rate
- **OTP Settings**: Configure email and SMS OTP settings
- **Server-Side DataTables**: All admin tables use server-side processing for better performance with search, filters, and pagination
- **Modern Admin UI**: Beautiful, consistent design across all admin pages with gradient headers, improved filters, and enhanced card styling
- **Professional Login Page**: Modern glassmorphism design with animated gradient background and custom CAPTCHA security
- **Custom CAPTCHA System**: Built-in image-based CAPTCHA on admin login for enhanced security (no third-party dependencies)
- **Breadcrumbs**: Automatic breadcrumb navigation throughout admin panel

### 🔐 **Security & Authorization**
- **Role-Based Access Control (RBAC)**: Using Spatie Laravel Permission
- **Route-Based Permissions**: Individual permissions for each admin route (automatically discovered)
- **User Authorization**: Users can only access their own orders and data
- **CSRF Protection**: Built-in Laravel security features
- **Input Validation**: Comprehensive form validation and sanitization
- **XSS Protection**: All user inputs are properly escaped
- **Admin CAPTCHA**: Custom image-based CAPTCHA system on admin login page to prevent brute-force attacks (one-time use, case-insensitive validation)

### 📊 **Technical Features**
- **Eloquent ORM**: Clean, expressive database interactions
- **Database Migrations**: Version-controlled database schema
- **Model Factories**: Automated test data generation
- **Pagination**: Efficient data loading with Bootstrap 5 pagination
- **Server-Side Processing**: DataTables with AJAX for large datasets
- **API Ready**: RESTful API endpoints for mobile app integration
- **Session Management**: Secure cart and user session handling
- **Referral System**: Shareable `/r/{code}` links; awards referrer on successful signup
- **Rich Text Editor**: Quill editor for product descriptions and page content
- **Live Search**: AJAX-powered real-time product search with debouncing
- **Custom Error Pages**: Professional error pages with unique animations, gradient backgrounds, and responsive design for all HTTP error codes
- **Schema.org Structured Data**: JSON-LD structured data for SEO optimization, rich snippets, and enhanced search engine visibility
- **Dynamic Sitemap**: XML sitemap generation for search engine indexing with admin-configurable priorities and update frequencies

## 🚀 Why Use This eCommerce System?

### **For Developers**
- **Clean Architecture**: Follows Laravel best practices and MVC pattern
- **Extensible**: Easy to add new features and customize functionality
- **Well Documented**: Comprehensive code comments and structure
- **Modern Stack**: Built with latest Laravel 12 and PHP 8.3+
- **Security First**: Implements industry-standard security practices
- **Performance Optimized**: Server-side processing, eager loading, efficient queries

### **For Business Owners**
- **Complete Solution**: Everything needed to start selling online
- **Professional Design**: Modern, responsive interface that builds trust
- **Easy Management**: Intuitive admin panel for non-technical users
- **Customer Engagement**: Reviews, ratings, newsletter, and loyalty points
- **Scalable**: Built to handle growth from startup to enterprise
- **Cost Effective**: Open source solution with no licensing fees

### **For Customers**
- **Fast Performance**: Optimized for speed and user experience
- **Mobile Friendly**: Perfect shopping experience on all devices
- **Secure Checkout**: Safe and reliable payment processing
- **Order Tracking**: Complete visibility into order status and history
- **Product Reviews**: Read and write reviews to make informed decisions
- **Live Search**: Quick product discovery with instant results

## 📋 Requirements

- **PHP**: 8.3 or higher
- **Composer**: Latest version
- **Database**: MySQL, PostgreSQL, or SQLite
- **Web Server**: Apache, Nginx, or Laravel Valet
- **Node.js**: For asset compilation (optional)

## 🛠️ Installation

### 1. Clone the Repository
```bash
git clone https://github.com/needyamin/eCommerceLaravel
cd eCommerceLaravel
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

This will:
- Create admin and test user accounts
- Set up roles and permissions (automatically discovers all admin routes)
- Seed categories, products, currencies, coupons
- Configure default site settings (reviews, newsletter, etc.)
- Create default customer service pages (Help Center, Shipping Info, Returns, Contact Us)

Optional seeders (recommended for admin RBAC and payments):
```bash
php artisan db:seed --class=Database\Seeders\AdminRoutePermissionsSeeder
php artisan db:seed --class=Database\Seeders\PaymentGatewaySettingsSeeder
php artisan db:seed --class=Database\Seeders\PageSeeder
```

### 5.1 Feature Migrations (Coins, Referral, Shipping, Reviews, Pages)
If you're upgrading an existing install, run these specific migrations:
```bash
php artisan migrate --path=database/migrations/2025_10_24_130000_add_coins_to_users_and_create_user_points_table.php
php artisan migrate --path=database/migrations/2025_10_24_131000_create_coin_settings_table.php
php artisan migrate --path=database/migrations/2025_10_24_132000_add_referral_fields_to_users_table.php
php artisan migrate --path=database/migrations/2025_10_24_133000_add_flags_to_coin_settings_table.php
php artisan migrate --path=database/migrations/2025_10_24_134000_create_shipping_settings_table.php
php artisan migrate --path=database/migrations/2025_10_24_134500_add_global_rate_to_shipping_settings_table.php
php artisan migrate --path=database/migrations/2025_11_07_022231_create_product_reviews_table.php
php artisan migrate --path=database/migrations/2025_11_07_022251_add_review_settings_to_site_settings_table.php
php artisan migrate --path=database/migrations/2025_11_07_023046_add_newsletter_settings_to_site_settings_table.php
php artisan migrate --path=database/migrations/2025_11_07_024826_add_customer_service_links_to_site_settings_table.php
php artisan migrate --path=database/migrations/2025_11_07_025029_create_pages_table.php
```

After migrating, visit Admin → Site Settings, Admin → Coin Settings, and Admin → Shipping Settings to configure.

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
- **Role**: Super Admin

### Test User Account
- **Email**: `test@example.com`
- **Password**: `password`

## 📁 Project Structure

```
├── app/
│   ├── Http/Controllers/
│   │   ├── Admin/           # Admin panel controllers
│   │   │   ├── DataTableController.php  # Server-side DataTables handler (supports all resources)
│   │   │   ├── PageController.php       # Pages CRUD
│   │   │   ├── ReviewController.php      # Reviews management
│   │   │   ├── UserActivityController.php # Cart/Wishlist/Session activity tracking
│   │   │   ├── CaptchaController.php     # Custom CAPTCHA generation and validation
│   │   │   └── ...                     # Other admin controllers
│   │   ├── Api/             # API controllers
│   │   │   ├── AuthController.php       # Authentication (register, login, logout, profile)
│   │   │   ├── ProductController.php    # Products listing and details
│   │   │   ├── CategoryController.php  # Categories listing
│   │   │   ├── CartController.php      # Cart operations (guest & auth)
│   │   │   ├── OrderController.php     # Orders and checkout
│   │   │   ├── WishlistController.php  # Wishlist operations (guest & auth)
│   │   │   ├── AddressController.php   # User addresses CRUD
│   │   │   └── CouponController.php    # Coupon validation and application
│   │   ├── ProductController.php        # Frontend products (includes search)
│   │   ├── ReviewController.php          # Frontend reviews
│   │   ├── PageController.php            # Frontend pages
│   │   ├── NewsletterController.php     # Newsletter subscription
│   │   └── SitemapController.php        # Dynamic sitemap.xml generation
│   ├── Models/              # Eloquent models
│   │   ├── ProductReview.php            # Product reviews model
│   │   ├── Page.php                     # Pages model
│   │   └── ...
│   └── Providers/           # Service providers
│   └── Support/             # Helper classes
│       ├── SchemaOrgHelper.php         # Schema.org structured data generator
│       ├── CurrencyManager.php         # Currency management
│       └── ...
├── database/
│   ├── migrations/          # Database schema
│   │   ├── create_product_reviews_table.php
│   │   ├── create_pages_table.php
│   │   ├── add_review_settings_to_site_settings_table.php
│   │   ├── add_newsletter_settings_to_site_settings_table.php
│   │   └── add_customer_service_links_to_site_settings_table.php
│   ├── seeders/             # Sample data
│   │   ├── PageSeeder.php               # Default pages seeder
│   │   └── ...
│   └── factories/           # Model factories
├── resources/
│   ├── views/
│   │   ├── admin/           # Admin panel views
│   │   │   ├── pages/                  # Pages CRUD views
│   │   │   ├── reviews/                # Reviews management views
│   │   │   └── ...
│   │   ├── pages/           # Frontend page views
│   │   ├── errors/          # Custom error pages (404, 500, 403, 401, 503, 429)
│   │   ├── layouts/         # Layout templates
│   │   ├── partials/        # Partial views
│   │   │   └── nav.blade.php           # Navigation with live search
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
- Admin routes are protected by route‑name permissions (e.g., `admin.products.edit`).
- Use Admin → Role & Permission to assign both named and route‑based permissions.
- Route permissions are automatically discovered and created by `AdminRoutePermissionsSeeder`.
- Seed all current admin route permissions and grant to Super Admin:
```bash
php artisan db:seed --class=Database\Seeders\AdminRoutePermissionsSeeder
```

### Site Settings
Configure all site-wide settings from Admin → Site Settings:
- **Basic Information**: Site name, tagline, logo, favicon
- **SEO**: Meta title, description, keywords
- **Legal & Footer**: Footer text, privacy/terms/cookies URLs, customer service links
- **Social Media**: Facebook, Twitter, Instagram, LinkedIn links
- **Feature Toggles**: Enable/disable wishlist, reviews, newsletter
- **Review Settings**: Control review requirements (purchase, approval, anonymous)
- **Newsletter Settings**: Configure double opt-in and welcome emails
- **Schema.org Settings**: Enable/disable structured data, configure organization details (name, logo, phone, email, address, type)
- **Sitemap Settings**: Enable/disable sitemap, configure priorities (1-10) for homepage/products/categories/pages, set change frequency

### Pages Management
Create and manage custom pages from Admin → Pages:
- Use rich text editor (Quill) for content
- Set SEO meta tags per page
- Control visibility with active/inactive status
- Sort pages with sort order
- Default pages: Help Center, Shipping Info, Returns, Contact Us

### Reviews System
- **Frontend**: Customers can leave reviews on product pages (if enabled)
- **Settings**: Control via Admin → Site Settings → Review Settings
- **Management**: Approve/reject/delete reviews from Admin → Reviews
- **Features**: Star ratings (1-5), verified purchase badges, admin moderation

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

### Coins Configuration
- Admin → Coin Settings: toggle coins system on/off and configure awards
- Profile shows coin balance; admin user page allows Adjust and Reset

### Custom Error Pages
The system includes beautiful, animated custom error pages for all common HTTP errors:
- **404 - Page Not Found**: Purple gradient with floating animations
- **500 - Internal Server Error**: Pink/red gradient with shaking effect
- **403 - Forbidden**: Warm gradient with bouncing shield icon
- **401 - Unauthorized**: Blue gradient with pulsing lock icon
- **503 - Service Unavailable**: Soft pastel gradient with spinning gear
- **429 - Too Many Requests**: Pink gradient with countdown timer

All error pages feature:
- Animated gradient backgrounds
- Floating decorative shapes
- Unique icon animations per error type
- Fully responsive design
- Helpful action buttons (Go Home, Go Back, Login, etc.)

Error pages are automatically used by Laravel when exceptions occur. Located in `resources/views/errors/`.

### Schema.org Structured Data
The system automatically adds Schema.org JSON-LD structured data to improve SEO and enable rich snippets in search results:

- **Homepage**: Organization schema (with social links) and WebSite schema (with search action)
- **Product Pages**: Product schema with offers, reviews, ratings, aggregate ratings, and breadcrumbs
- **Category Pages**: CollectionPage schema and breadcrumbs
- **All Pages**: Breadcrumb navigation schema

**Features**:
- JSON-LD format (Google's recommended format)
- Product reviews and aggregate ratings included
- Currency-aware pricing
- Organization information with contact details
- Social media links in organization schema
- Search action for website schema

**Configuration**: Admin → Site Settings → Schema.org Settings
- Enable/disable Schema.org
- Set organization name, logo, phone, email, address
- Choose organization type (Store, LocalBusiness, Organization, Corporation)

### Sitemap Configuration
The system generates a dynamic XML sitemap at `/sitemap.xml` for search engines:

- **Automatic Generation**: Includes all active products, categories, and pages
- **Configurable Priorities**: Set priority (1-10) for homepage, products, categories, and pages
- **Change Frequency**: Configure how often content is updated (always, hourly, daily, weekly, monthly, yearly, never)
- **SEO Optimized**: Proper XML format with lastmod dates

**Configuration**: Admin → Site Settings → Sitemap Settings
- Enable/disable sitemap generation
- Set priorities for different content types
- Configure change frequency
- Direct link to view sitemap

**Usage**: Submit `/sitemap.xml` to Google Search Console and Bing Webmaster Tools for better indexing.

### Shipping Configuration
- Admin → Shipping Settings: enable shipping, set free shipping minimum, define per‑country/city rates, and a global fallback rate
- Checkout totals include dynamic shipping and currency formatting

### Payment Gateways
- **Stripe**: Configure API keys, enable/disable, test connection
- **PayPal**: Configure client ID/secret, enable/disable, sandbox mode
- **Cash on Delivery (COD)**: Enable/disable from Admin → Payment Gateways → COD
- All payment methods are configurable from Admin → Payment Gateways

## 📚 API Documentation

The system includes comprehensive RESTful API endpoints for mobile app integration. All endpoints return JSON responses with proper error handling and validation.

### Authentication
- `POST /api/register` - User registration (email or phone required)
- `POST /api/login` - User login (email or phone)
- `POST /api/logout` - User logout (authenticated)
- `GET /api/user` - Get current user profile (authenticated)
- `PUT /api/user` - Update user profile (authenticated)
- `PUT /api/user/password` - Change password (authenticated)

### Products & Categories
- `GET /api/categories` - List all categories
- `GET /api/categories/{slug}` - Get category details
- `GET /api/products` - List products (supports `q`, `category_id`, `per_page` query parameters)
- `GET /api/products/{slug}` - Get product details
- `GET /products/search?q={query}` - Live search (returns JSON, requires 3+ characters)

### Addresses
- `GET /api/user/addresses` - List user addresses (authenticated)
- `POST /api/user/addresses` - Create new address (authenticated)
- `PUT /api/user/addresses/{address}` - Update address (authenticated)
- `DELETE /api/user/addresses/{address}` - Delete address (authenticated)
- `POST /api/user/addresses/{address}/set-default` - Set default address (authenticated)

### Coupons
- `POST /api/coupons/apply` - Apply coupon code
- `POST /api/coupons/remove` - Remove applied coupon
- `POST /api/coupons/validate` - Validate coupon code

### Cart & Orders
- `GET /api/cart` - Get user cart (supports guest sessions via `X-Cart-Session` header)
- `POST /api/cart/add` - Add item to cart (with stock validation)
- `PUT /api/cart/items/{item}` - Update cart item quantity (with stock validation)
- `DELETE /api/cart/items/{item}` - Remove item from cart
- `POST /api/cart/clear` - Clear entire cart
- `GET /api/orders` - List user orders (paginated)
- `GET /api/orders/{id}` - Get order details
- `POST /api/checkout` - Place order (requires authentication)

### Wishlist
- `POST /api/wishlist/toggle` - Add/remove product from wishlist (supports guest sessions via `X-Wishlist-Session` header)
- `GET /api/wishlist` - Get user wishlist items (authenticated only)

### Reviews
- `POST /products/{product}/reviews` - Submit a product review (authenticated)
- `DELETE /reviews/{review}` - Delete own review (authenticated)

### Pages
- `GET /page/{slug}` - View a custom page

### Sitemap
- `GET /sitemap.xml` - Dynamic XML sitemap for search engines (includes all active products, categories, and pages)

### Newsletter
- `POST /newsletter/subscribe` - Subscribe to newsletter
- `POST /newsletter/unsubscribe` - Unsubscribe from newsletter
- `GET /newsletter/confirm/{token}` - Confirm subscription (double opt-in)

### OTP
- Email & SMS OTP request/verify endpoints (UI available under `/otp/email` and `/otp/sms`)

### API Authentication
Most endpoints require authentication using Laravel Sanctum. Include the token in the Authorization header:
```
Authorization: Bearer {your_token_here}
```

### Guest Sessions
For guest users, include session headers:
- `X-Cart-Session`: For cart operations (server returns if missing)
- `X-Wishlist-Session`: For wishlist operations (server returns if missing)

### API Response Format
All API responses follow a consistent format:
- **Success responses**: Return data directly or in a `data` field
- **Error responses**: Include `message` and optional `errors` or `error` fields
- **Pagination**: Uses `data` array and `meta` object with pagination info
- **Money fields**: Return both `amount` (float) and `formatted` (string) for currency values

## 🧪 Testing

Run the test suite:
```bash
php artisan test
```

Note: If using SQLite for tests, ensure `pdo_sqlite` is installed; or configure tests to use MySQL by setting `DB_CONNECTION=mysql` for the testing environment.

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

## 🐳 Docker Deployment

### Quick Start with Docker

1. **Copy environment file:**
   ```bash
   cp .env.docker.example .env
   ```

2. **Update `.env` file with your configuration**

3. **Build and start containers:**
   ```bash
   docker-compose up -d --build
   ```

4. **Install dependencies and setup:**
   ```bash
   docker-compose exec app composer install
   docker-compose exec app php artisan key:generate
   docker-compose exec app php artisan migrate --seed
   docker-compose exec app php artisan storage:link
   ```

5. **Access the application:**
   - Frontend: http://localhost:8000
   - Database: localhost:3306
   - Redis: localhost:6379

### Production Deployment with Docker

For production deployment, use the production override:

```bash
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
```

See [DOCKER.md](DOCKER.md) for detailed Docker setup instructions, SSL configuration, backup strategies, and troubleshooting.

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
- [Bootstrap 5](https://getbootstrap.com) - CSS framework
- [Quill](https://quilljs.com) - Rich text editor
- [DataTables](https://datatables.net) - Advanced table features

## 📞 Support

For support, email needyain@gmail.com or create an issue on GitHub.

---

**Built with ❤️ using Laravel 12**
