# 🛒 Laravel eCommerce System

A modern, feature-rich eCommerce platform built with Laravel 12. Perfect for online stores with a powerful admin panel and beautiful storefront.

![Laravel](https://img.shields.io/badge/Laravel-12.x-red.svg)
![PHP](https://img.shields.io/badge/PHP-8.2+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

<img width="933" height="917" alt="Image" src="https://github.com/user-attachments/assets/f98a758e-2377-4ea7-95b7-a3edd05c020f" />
<img width="1919" height="917" alt="Image" src="https://github.com/user-attachments/assets/44e6c9c8-6e69-4221-9ab0-58d3ed3dad40" />

## 🚀 Installation & Setup

### Requirements
- PHP 8.2+
- Composer
- MySQL/PostgreSQL/SQLite
- Node.js 18+ (for asset compilation)

### Quick Installation (3 Steps)

1. **Clone and install:**
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

3. **Access web installer:**
Visit `http://localhost:8000/installer` - The installer will automatically:
- ✅ Check system requirements (PHP, extensions, permissions)
- ✅ Test database connection
- ✅ Create database tables
- ✅ Seed sample data
- ✅ Create admin account
- ✅ Disable installer after completion

**That's it!** The installer handles everything automatically.

> **Default Login** (if using manual seeding):  
> Admin Panel: `http://localhost:8000/admin/login`  
> Email: `needyamin@gmail.com`  
> Password: `needyamin@gmail.com`  
> Role: Super Admin (has all permissions)

### 📦 What Gets Created?

After installation, you'll have:
- ✅ **1 Admin Account** - Super Admin with all permissions
- ✅ **1 User Account** - Test customer account
- ✅ **6 Categories** - With subcategories
- ✅ **72 Products** - 12 products per category with images
- ✅ **216 Product Images** - 3 images per product
- ✅ **4 Currencies** - BDT, USD, EUR, GBP
- ✅ **5 Sample Coupons** - Ready-to-use discount codes
- ✅ **Bangladesh Data** - All divisions, districts, upazilas
- ✅ **124+ Permissions** - All admin route permissions
- ✅ **Default Pages** - About, Terms, Privacy, etc.

### 🔒 Installer Security

- **Auto-Disable**: Installer is automatically disabled after successful installation
- **Database Control**: Installer status stored in `site_settings` table
- **Re-enable**: Update `installer_enabled = true` in database to re-enable
- **Security Check**: Validates PHP version, extensions, and folder permissions
- **Database Testing**: Tests database connection before proceeding

### 📊 Database Structure

The system includes **30+ database tables** organized into:

**Core E-commerce Tables:**
- `admins`, `users` - User accounts
- `categories`, `products`, `product_images` - Product management
- `orders`, `order_items` - Order processing
- `carts`, `cart_items` - Shopping cart
- `coupons`, `coupon_usages` - Discount system
- `wishlists`, `guest_wishlists` - Wishlist functionality
- `product_reviews` - Reviews and ratings
- `user_addresses` - Customer addresses
- `user_points` - Coins/loyalty points
- `currencies` - Multi-currency support

**Location Data:**
- `districts` - Bangladesh districts (64 districts)
- `upazilas` - Bangladesh upazilas (500+ upazilas)

**Settings & Configuration:**
- `site_settings` - Site config, SEO, theme, license
- `email_settings` - SMTP configuration
- `otp_settings` - OTP/SMS settings
- `payment_gateway_settings` - Payment gateways
- `shipping_settings` - Shipping and tax
- `storage_settings` - Storage/CDN config
- `coin_settings` - Coins system settings
- `newsletter_settings` - Newsletter config
- `pages` - Static pages

**System Tables:**
- `roles`, `permissions` - RBAC (Spatie Permissions)
- `model_has_roles`, `model_has_permissions` - Role assignments
- `cache`, `sessions` - Application cache and sessions
- `jobs`, `failed_jobs` - Queue system
- `newsletter_subscribers` - Newsletter subscribers

**Database File:** `ecommerce.sql` - Complete database dump with all tables and sample data

---

## ✨ Key Features

### Storefront
- Product catalog with categories and subcategories
- Live search, shopping cart, and wishlist
- Checkout with Bangladeshi address system (Division, District, Upazila)
- Multiple payment gateways (bKash, Nagad, Rocket, SSL Commerce, Stripe, PayPal, COD)
- Coupon/Discount system with usage limits
- Product reviews and ratings
- Newsletter subscriptions
- Coins (Loyalty Points) system
- Referral system with user codes
- Responsive design with Tailwind CSS 4.0

### Admin Panel
- **Dashboard** with analytics and statistics
- **Role-Based Access Control (RBAC)** - Complete permission system
- **Advanced Product Management**
  - Product images with drag-and-drop upload
  - Image reordering and primary image selection
  - Rich HTML descriptions with Quill Editor
  - Category and subcategory support
  - Stock management
  - Featured products
  - Sale pricing (Original Price vs Current Price)
- **Advanced Product Filters** ⭐ NEW
  - Collapsible filter section
  - Product name search with Select2 (AJAX search)
  - Category and subcategory filters
  - Stock status filter (In Stock, Out of Stock, Low Stock)
  - Featured products filter
  - On Sale filter
  - Price range filter (Min/Max)
  - Status filter (Active/Inactive)
  - "ALL" indicator when no filter is selected
  - Clear filters button
  - Auto-reset on page reload
- **Enhanced DataTables** ⭐ NEW
  - Product images in table view
  - Category and subcategory columns
  - Price and Original Price columns (centered)
  - Stock quantity with color-coded badges
  - Consistent button group styling for actions
  - CSV export (all data and current view)
  - Server-side processing for performance
- **Orders Management** - View and manage customer orders
- **Users Management** - Manage customers, coins, and referrals
- **Coupons Management** - Create and manage discount codes
- **Categories Management** - Hierarchical categories with subcategories
- **Multi-Currency Support** - BDT, USD, EUR, GBP with switching
- **Payment Gateways** - Configure multiple gateways with sandbox mode
- **Shipping & Tax** - Configure rates for Bangladeshi divisions/districts
- **Email & SMS OTP** - Multiple SMS providers support
- **Storage & CDN** - S3, Cloudflare R2, DigitalOcean Spaces, Wasabi, Backblaze B2
- **Site Settings** - SEO, Schema.org, Sitemap, Newsletter, Reviews
- **Backup & Restore** - Export/import products, WordPress/Shopify import
- **Pages Management** - Create and manage static pages

## 🛠️ Manual Installation (Alternative)

If you prefer manual installation instead of the web installer:

1. **Environment setup:**
```bash
cp .env.example .env
php artisan key:generate
```

2. **Configure database in `.env`:**
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ecommerce_laravel
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

3. **Run migrations and seeders:**
```bash
php artisan migrate --seed
```

4. **Build assets (optional):**
```bash
npm run build
# or for development
npm run dev
```

5. **Start server:**
```bash
php artisan serve
```

Visit `http://localhost:8000` and login with default credentials.

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
- **HTML Descriptions**: Rich HTML content with Quill Editor (image/video options removed)
- **Subcategories**: Hierarchical category system with parent/child relationships
- **Select2 Search**: Enhanced dropdowns with search functionality
- **Product Factory**: Generates sample products with images automatically during seeding

## 🔍 Advanced Filtering System ⭐ NEW

The products page includes a powerful filtering system:

- **Collapsible Filters**: Filters are hidden by default, click "Show Filters" to expand
- **Product Name Search**: Select2 AJAX search - type to find products instantly
- **Category Filter**: Select parent categories with Select2 search
- **Subcategory Filter**: Automatically loads when category is selected
- **Stock Status**: Filter by In Stock, Out of Stock, or Low Stock (<10 items)
- **Featured Filter**: Show only featured or non-featured products
- **Sale Status**: Filter products on sale or regular price
- **Price Range**: Set minimum and maximum price filters
- **Status Filter**: Filter by Active or Inactive products
- **Visual Indicators**: All filters show "ALL" when no filter is applied
- **Auto Reset**: All filters reset on page reload
- **Clear Filters**: One-click button to clear all filters

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

## 🔧 Admin Panel Features

### Products Management
- **List View**: Enhanced DataTable with images, categories, prices, stock
- **Advanced Filters**: Collapsible filter section with multiple filter options
- **Product Search**: Select2 AJAX search for quick product finding
- **Image Display**: Product thumbnails in table view
- **Bulk Actions**: Export to CSV (all data or current view)
- **Create/Edit**: Rich form with Select2 dropdowns, Quill Editor, image management

### DataTables Enhancements ⭐ NEW
- **Product Images**: Small thumbnails displayed in table
- **Category Display**: Shows parent category and subcategory separately
- **Price Columns**: Current Price and Original Price (centered alignment)
- **Stock Badges**: Color-coded badges (green for in stock, red for out of stock)
- **Action Buttons**: Consistent button group styling across all tables
- **CSV Export**: Export all data or current filtered view
- **Server-Side Processing**: Fast loading even with thousands of products

### Other Admin Features
- **Categories**: Hierarchical with subcategories, shows all categories/subcategories
- **Orders**: View and manage customer orders
- **Users**: Manage customer accounts, coins, referrals
- **Coupons**: Create discount codes with usage limits
- **Currencies**: Multi-currency support with switching
- **Roles & Permissions**: Complete RBAC system
- **Payment Gateways**: Configure with sandbox/test mode
- **Shipping Settings**: Bangladeshi divisions/districts support
- **Email & SMS**: SMTP and multiple SMS providers
- **Storage & CDN**: S3-compatible storage options
- **Site Settings**: SEO, Schema.org, Sitemap configuration
- **Backup & Restore**: Export/import products, WordPress/Shopify import
- **Pages**: Manage static pages


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

## 📦 Complete Seeded Data List

After running `php artisan migrate --seed` or using the installer, the following data is automatically created:

### Accounts
- **1 Admin Account** - Super Admin role with all permissions
  - Email: `needyamin@gmail.com` (or custom if using installer)
  - Password: `needyamin@gmail.com` (or custom if using installer)
- **1 User Account** - Test customer account (same credentials as admin)

### Products & Categories
- **6 Parent Categories** - Electronics, Clothing, Books, Home & Garden, Sports, Toys
- **Multiple Subcategories** - Under each parent category
- **72 Products** - 12 products per category
  - Each product includes: name, description, price, stock, SKU
  - Featured products included
  - Products with sale prices (compare_at_price)
- **216 Product Images** - 3 images per product
  - Images are automatically generated/assigned
  - Primary images are set

### E-commerce Data
- **4 Currencies** - BDT (৳), USD ($), EUR (€), GBP (£)
  - BDT set as default currency
- **5 Sample Coupons**:
  - `WELCOME10` - 10% off (Welcome coupon)
  - `SAVE20` - 20% off
  - `FREESHIP` - Free shipping
  - `HOLIDAY25` - 25% off (Holiday special)
  - `STUDENT15` - 15% off (Student discount)

### Location Data
- **8 Divisions** - All administrative divisions of Bangladesh
- **64 Districts** - All districts under divisions
- **500+ Upazilas** - All upazilas under districts

### System Data
- **124+ Route Permissions** - All admin routes automatically discovered
- **1 Super Admin Role** - With all permissions assigned
- **Default Pages** - About Us, Terms & Conditions, Privacy Policy, etc.
- **Payment Gateway Settings** - Pre-configured with test/sandbox credentials
- **Email Settings** - SMTP configuration template
- **OTP Settings** - Email and SMS OTP providers configured

## 🆕 Recent Updates

### Latest Features (2025)
- ✅ **Advanced Product Filters** - Collapsible filter section with Select2 search
- ✅ **Product Name Search** - AJAX-powered product search with Select2
- ✅ **Enhanced DataTables** - Product images, improved columns, better styling
- ✅ **Button Group Styling** - Consistent action buttons across all tables
- ✅ **Filter Auto-Reset** - Filters reset on page reload
- ✅ **"ALL" Indicators** - Clear visual feedback when no filters are applied
- ✅ **Category Improvements** - Shows all categories/subcategories, removed slug column
- ✅ **Price Display** - Original Price column (renamed from Compare at Price)
- ✅ **Centered Columns** - Image, Price, and Original Price columns centered
- ✅ **Stock Badges** - Color-coded stock quantity indicators

## 📞 Support

Email: needyamin@gmail.com or create an issue on GitHub.

---

**Built with ❤️ using Laravel 12**
