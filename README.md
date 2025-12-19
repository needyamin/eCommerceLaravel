# 🛒 Laravel eCommerce System

A comprehensive, modern eCommerce platform built with Laravel 12, featuring a beautiful storefront and powerful admin panel with role-based access control.

![Laravel](https://img.shields.io/badge/Laravel-12.x-red.svg)
![PHP](https://img.shields.io/badge/PHP-8.2+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## ✨ Key Features

### Storefront
- Product catalog with categories and subcategories
- Live search, shopping cart, wishlist (guest and authenticated)
- Checkout with Bangladeshi address system (Division, District, Upazila)
- Payment gateways: bKash, Nagad, Rocket, SSL Commerce, Stripe, PayPal, COD
- **Coupon/Discount System** - Percentage and fixed discounts with usage limits
- Product reviews, ratings, and newsletter subscriptions
- **Coins (Loyalty Points) System** - Earn and redeem points
- **Referral System** - User referral codes and rewards
- Custom product pages with visual page builder
- HTML-rich product descriptions
- Responsive Tailwind CSS 4.0 design

### Admin Panel
- Dashboard with analytics
- **Role-Based Access Control (RBAC)** - Spatie Permissions with automatic route permission discovery
- Products & Categories (with subcategories support)
- **Product Page Builder** - Visual drag-and-drop page builder for custom product pages
- **Product Image Management** - Drag-and-drop upload, reorder, set primary, delete
- Orders, Users, Coupons management
- **Multi-Currency Support** - BDT, USD, EUR, GBP with currency switching
- Payment Gateway management (with sandbox/test mode)
- Shipping & Tax settings (Bangladeshi divisions/districts)
- Email & SMS OTP settings (multiple SMS providers)
- **Storage & CDN Settings** - Configure S3, Cloudflare R2, DigitalOcean Spaces, Wasabi, Backblaze B2
- **Site Settings** - SEO, Schema.org, Sitemap, Newsletter, Reviews configuration
- Server-side DataTables for performance

## 📋 Requirements

- PHP 8.2+
- Composer
- MySQL/PostgreSQL/SQLite
- Node.js 18+ (for asset compilation with Vite)

## 🛠️ Installation

### Option 1: Web-Based Installer (Recommended)

1. **Clone and install dependencies:**
```bash
git clone https://github.com/needyamin/eCommerceLaravel
cd eCommerceLaravel
composer install
npm install
```

2. **Start server:**
```bash
php artisan serve
```

3. **Access the installer:**
Visit `http://localhost:8000/installer` in your browser

The installer will guide you through:
- ✅ System requirements check (PHP version, extensions, folder permissions)
- ✅ Database configuration (with connection testing)
- ✅ Admin account setup
- ✅ Automatic database migration and seeding
- ✅ Installation completion

After successful installation, the installer is automatically disabled in the database for security. To re-enable it, update `installer_enabled = true` in the `site_settings` table.

### Option 2: Manual Installation

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

This will create:
- Default admin and user accounts
- 6 categories with 12 products each (72 products total)
- 3 product images per product
- 4 currencies (BDT, USD, EUR, GBP)
- 5 sample coupons
- Bangladesh districts and upazilas data
- Default pages
- All admin route permissions
- Super Admin role with all permissions

5. **Build assets (optional for development):**
```bash
npm run build
# or for development
npm run dev
```

6. **Start server:**
```bash
php artisan serve
```

Visit `http://localhost:8000`

## 👤 Default Accounts

After installation (via installer or manual seeding), you can login with:

- **Admin Panel**: `http://localhost:8000/admin/login`
  - Email: The email you provided during installation (or `needyamin@gmail.com` if using manual seeding)
  - Password: The password you set during installation (or `needyamin@gmail.com` if using manual seeding)
  - Role: Super Admin (has all permissions)

- **User Account** (Storefront):
  - Email: Same as admin email
  - Password: Same as admin password

> **Note**: If using the web installer, you'll set custom admin credentials during installation. The installer automatically creates the admin account with Super Admin role and all permissions.

## 💳 Payment Gateways

Configure from Admin → Payment Gateways:
- **bKash** - Mobile banking (Tokenized Checkout API) - Sandbox credentials pre-configured
- **Nagad** - Mobile banking - Sandbox mode supported
- **Rocket** - Mobile banking - Sandbox mode supported
- **SSL Commerce** - Card payments - Test store credentials pre-configured
- **Stripe** - Card payments - Test keys pre-configured
- **PayPal** - Online payments - Sandbox mode supported
- **Cash on Delivery (COD)** - Always available

All gateways support sandbox/test mode for testing. Default test credentials are seeded automatically.

## 🚚 Shipping & Tax

Configure from Admin → Shipping Settings:
- Enable/disable shipping
- Flat rate shipping
- Free shipping threshold
- Division-based rates (flat or percentage)
- District-based rates (flat or percentage)
- Tax settings (flat or percentage)
- Default currency: BDT (৳) - Pre-configured with BDT, USD, EUR, GBP

**Bangladesh Address System:**
- Complete Division, District, and Upazila data seeded automatically
- Address fields support all administrative levels

## 📧 Email & SMS

- **Email Settings**: Admin → Email Settings (SMTP configuration with cPanel auto-detection)
- **OTP Settings**: Admin → OTP Settings (Email & SMS OTP with multiple SMS providers: Twilio, Vonage, MessageBird, AWS SNS, Clickatell, Plivo, Laravel BDSMS, Custom)

## 🖼️ Product Management

- **Image Upload**: Drag-and-drop multiple images with preview
- **Image Management**: Reorder, set primary, delete images
- **Page Builder**: Visual drag-and-drop page builder for custom product pages
- **HTML Descriptions**: Rich HTML content support in product descriptions
- **Subcategories**: Hierarchical category system with parent/child relationships
- **Product Factory**: Generates sample products with images automatically during seeding

## 🎫 Coupon & Discount System

- **Coupon Types**: Percentage or fixed amount discounts
- **Usage Limits**: Global and per-user usage limits
- **Minimum Amount**: Set minimum order value requirements
- **Maximum Discount**: Cap discount amounts for percentage coupons
- **Validity Period**: Start and expiration dates
- **Category/Product Specific**: Apply coupons to specific categories or products
- **Pre-seeded Coupons**: 5 sample coupons created during seeding (WELCOME10, SAVE20, FREESHIP, HOLIDAY25, STUDENT15)

## ☁️ Storage & CDN

Configure from Admin → Storage & CDN:
- **Local Storage** (default)
- **AWS S3**
- **Cloudflare R2** (S3-compatible)
- **DigitalOcean Spaces** (S3-compatible)
- **Wasabi** (S3-compatible)
- **Backblaze B2** (S3-compatible)
- **CDN Support** - Configure CDN URL for static assets

## 🔧 Configuration

- **Site Settings**: Admin → Site Settings (SEO, Schema.org, Sitemap, social links, feature toggles, product display columns, installer control)
- **Products**: Admin → Products (with image management and page builder)
- **Categories**: Admin → Categories (hierarchical with subcategories)
- **Coupons**: Admin → Coupons (create and manage discount codes)
- **Currencies**: Admin → Currencies (manage multiple currencies)
- **Orders**: Admin → Orders (view and manage customer orders)
- **Users**: Admin → Users (manage customer accounts, coins, referrals)
- **Roles & Permissions**: Admin → Roles & Permissions (manage admin roles and route permissions)
- **Payment Gateways**: Admin → Payment Gateways (sandbox/test mode support)
- **Shipping Settings**: Admin → Shipping Settings (Bangladeshi divisions/districts)
- **Email Settings**: Admin → Email Settings (SMTP with cPanel auto-detection)
- **OTP Settings**: Admin → OTP Settings (Email & SMS with multiple providers)
- **Storage & CDN**: Admin → Storage & CDN (S3, Cloudflare R2, DigitalOcean Spaces, Wasabi, Backblaze B2)
- **Pages**: Admin → Pages (manage static pages)

## 🔒 Installer Security

The web-based installer includes built-in security features:

- **Automatic Disabling**: After successful installation, the installer is automatically disabled in the database (`installer_enabled = false` in `site_settings` table)
- **Access Control**: Installer routes return 404 when disabled
- **Database-Based**: Installer control is managed via database settings (no file deletion)
- **Re-enable Option**: To re-enable the installer, update `installer_enabled = true` in the `site_settings` table
- **Requirements Check**: Validates PHP version, extensions, and folder permissions before installation
- **Database Testing**: Tests database connection before proceeding with installation

## 🔐 Roles & Permissions

- **Automatic Permission Discovery**: All admin routes are automatically discovered and permissions created
- **Super Admin Role**: Pre-configured with all permissions
- **Route-Based Permissions**: Each admin route requires specific permission
- **Permission Middleware**: `admin.permission` middleware checks route permissions automatically

## 🔒 License & Code Protection

The application includes a built-in license validation system to protect against unauthorized use:

### License System Features

- **License Key Management**: Activate and manage license keys from Admin → Site Settings → Theme tab
- **Remote Validation**: Validates license with your server (optional)
- **Offline Mode**: 7-day grace period if license server is unreachable
- **Domain Locking**: License can be tied to specific domain
- **Automatic Checks**: Validates every 24 hours
- **License Removal**: Option to remove active license from admin panel

### Quick Setup

1. **Run Migration**:
   ```bash
   php artisan migrate
   ```

2. **Activate License**:
   - Visit Admin → Site Settings → Theme tab
   - Enter your license key and click "Validate"
   - Or visit `/admin/license/activate` for dedicated activation page

3. **Enable License Middleware** (Optional):
   - Edit `bootstrap/app.php` and uncomment `CheckLicense` middleware
   - This will block frontend and admin access without a valid license

4. **License Server** (Optional):
   - Update `app/Support/LicenseHelper.php` with your license server URL
   - Server should accept POST with `license_key` and `domain`, return JSON: `{"valid": true/false}`

### Code Protection Options

For additional protection, consider:
- **Code Obfuscation**: Use IonCube Encoder or Zend Guard for PHP encryption
- **Domain Restrictions**: Add domain/IP whitelisting in middleware
- **Legal Protection**: Create license agreements and copyright notices
- **Monitoring**: Log license validation attempts and track usage

> **Note**: Complete code protection is impossible for interpreted languages like PHP. The goal is to make unauthorized use difficult and legally risky, not impossible.

## 📄 License

MIT License - see [LICENSE](LICENSE) file

## 📦 Seeded Data

After running `php artisan migrate --seed`, the following data is created:

- **Users**: 1 test user account
- **Admins**: 1 admin account with Super Admin role
- **Categories**: 6 categories
- **Products**: 72 products (12 per category)
- **Product Images**: 216 images (3 per product)
- **Currencies**: 4 currencies (BDT, USD, EUR, GBP)
- **Coupons**: 5 sample coupons
- **Bangladesh Data**: All divisions, districts, and upazilas
- **Pages**: Default pages
- **Permissions**: All admin route permissions (124+ permissions)
- **Roles**: Super Admin role with all permissions

## 📞 Support

Email: needyamin@gmail.com or create an issue on GitHub.

---

**Built with ❤️ using Laravel 12**
