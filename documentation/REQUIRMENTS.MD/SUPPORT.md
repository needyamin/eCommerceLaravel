# Support Documentation

## 📞 Getting Support

For support requests, please contact: **needyain@gmail.com**

We aim to respond to all support requests within 24-48 hours during business days.

## 📚 Documentation

### Quick Links
- [Installation Guide](INSTALLATION.md)
- [API Documentation](documentation/api_documentation.html)
- [README](README.md)
- [Changelog](CHANGELOG.md)

## ❓ Frequently Asked Questions (FAQ)

### Installation

**Q: What are the minimum server requirements?**
A: PHP 8.3+, MySQL 5.7+ (or PostgreSQL/SQLite), Apache/Nginx, and required PHP extensions (see [Installation Guide](INSTALLATION.md)).

**Q: How do I install the system?**
A: Follow the step-by-step guide in [INSTALLATION.md](INSTALLATION.md).

**Q: I'm getting a 500 error after installation. What should I do?**
A: 
1. Check file permissions: `chmod -R 755 storage bootstrap/cache`
2. Verify `.env` file exists and `APP_KEY` is set
3. Check `storage/logs/laravel.log` for detailed errors
4. Temporarily set `APP_DEBUG=true` to see error details

**Q: Images are not displaying. How do I fix this?**
A: Run `php artisan storage:link` to create a symbolic link from `public/storage` to `storage/app/public`.

**Q: How do I change the default admin password?**
A: Log in to admin panel → Go to **Administrators** → Edit your admin account → Change password.

### Configuration

**Q: How do I configure payment gateways?**
A: Go to **Admin → Payment Gateways**:
- **Stripe**: Enter publishable key and secret key
- **PayPal**: Enter client ID and client secret
- **COD**: Simply enable/disable

**Q: How do I set up email sending?**
A: Go to **Admin → Email Settings** and enter your SMTP credentials. You can test the connection from the same page.

**Q: How do I add multiple currencies?**
A: Go to **Admin → Currencies** → Create new currency → Set exchange rate → Set as default if needed.

**Q: How do I configure shipping rates?**
A: Go to **Admin → Shipping Settings**:
- Enable shipping
- Set free shipping threshold
- Add country/city specific rates
- Set global fallback rate

### Features

**Q: How does the coins/loyalty points system work?**
A: 
- Users earn coins for: adding to cart, placing orders, choosing COD, referring friends
- Admin can adjust/reset user coins from **Admin → Users → Edit User**
- Configure awards from **Admin → Coin Settings**

**Q: How do I enable product reviews?**
A: Go to **Admin → Site Settings → Review Settings**:
- Enable reviews
- Configure requirements (purchase required, approval required, allow anonymous)

**Q: How do I manage newsletter subscribers?**
A: Go to **Admin → Newsletter** to view, manage, and export subscribers.

**Q: How do I create custom pages?**
A: Go to **Admin → Pages → Create**:
- Enter title, slug, and content
- Set SEO meta tags
- Control visibility with active/inactive status

### Customization

**Q: How do I change the site logo?**
A: Go to **Admin → Site Settings → Basic Information** → Upload logo.

**Q: How do I customize the theme colors?**
A: Edit CSS files in `resources/css/app.css` or `public/admin-assets/css/adminlte.css`.

**Q: How do I add new payment gateways?**
A: You'll need to:
1. Create a new gateway controller in `app/Http/Controllers/PaymentGateway/`
2. Add gateway settings to database
3. Update checkout process to include new gateway
4. Add admin interface for configuration

**Q: Can I customize the product display columns?**
A: Yes! Go to **Admin → Site Settings → Product Display Settings**:
- Set products per row for mobile (1-4)
- Set products per row for desktop (2-6)

### API

**Q: How do I use the API?**
A: See [API Documentation](documentation/api_documentation.html) for complete endpoint details.

**Q: How do I authenticate API requests?**
A: Use Laravel Sanctum. Register/login via API to get a token, then include it in the `Authorization: Bearer {token}` header.

**Q: Do you support guest sessions for cart/wishlist?**
A: Yes! Include `X-Cart-Session` and `X-Wishlist-Session` headers in API requests. The server will return session IDs if missing.

### Troubleshooting

**Q: Orders are not being created. What's wrong?**
A: 
1. Check payment gateway configuration
2. Verify email settings (order confirmation emails)
3. Check `storage/logs/laravel.log` for errors
4. Ensure database connection is working

**Q: CAPTCHA is not displaying on admin login.**
A: 
1. Ensure PHP GD extension is installed: `php -m | grep gd`
2. Install GD if missing: `sudo apt-get install php-gd` (Ubuntu) or equivalent

**Q: Search is not working.**
A: 
1. Clear cache: `php artisan cache:clear`
2. Check database connection
3. Verify products exist in database

**Q: Emails are not sending.**
A: 
1. Check **Admin → Email Settings** configuration
2. Test connection from admin panel
3. Check spam folder
4. Verify SMTP credentials are correct
5. Check `storage/logs/laravel.log` for email errors

**Q: Images uploaded but not displaying.**
A: 
1. Run `php artisan storage:link`
2. Check file permissions on `storage/app/public`
3. Verify `.htaccess` allows image access
4. Check image paths in database

**Q: Admin sidebar items not showing.**
A: 
1. Ensure your admin user has proper roles assigned
2. Go to **Admin → Roles & Permission** → Assign permissions to your role
3. Clear cache: `php artisan config:clear`

## 🔧 Common Errors and Solutions

### Error: "SQLSTATE[HY000] [2002] Connection refused"

**Cause**: Database connection failed

**Solution**:
1. Verify database credentials in `.env`
2. Ensure database server is running
3. Check database host and port
4. Verify database user has access

### Error: "Class 'X' not found"

**Cause**: Autoloader issue

**Solution**:
```bash
composer dump-autoload
php artisan config:clear
php artisan cache:clear
```

### Error: "The stream or file could not be opened"

**Cause**: Storage directory permissions

**Solution**:
```bash
chmod -R 775 storage
chown -R www-data:www-data storage
```

### Error: "Route [X] not defined"

**Cause**: Route cache issue

**Solution**:
```bash
php artisan route:clear
php artisan route:cache
```

### Error: "419 Page Expired"

**Cause**: CSRF token expired or missing

**Solution**:
1. Clear browser cache and cookies
2. Ensure session driver is configured in `.env`
3. Check `SESSION_LIFETIME` setting
4. Verify `APP_KEY` is set

## 🛠️ Maintenance

### Clear All Caches

```bash
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear
```

### Optimize for Production

```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
composer install --optimize-autoloader --no-dev
```

### Backup Database

```bash
php artisan db:backup
# Or use mysqldump:
mysqldump -u username -p database_name > backup.sql
```

### Update Application

1. Backup your database and files
2. Download latest version
3. Replace files (keep `.env` and `storage` folder)
4. Run `composer install`
5. Run `php artisan migrate` (if new migrations exist)
6. Clear and rebuild cache

## 🔐 Security Best Practices

1. **Always use HTTPS** in production
2. **Change default passwords** immediately
3. **Keep PHP and Laravel updated**
4. **Regular database backups**
5. **Use strong database passwords**
6. **Limit admin access** to trusted users only
7. **Monitor error logs** regularly
8. **Keep `APP_DEBUG=false`** in production
9. **Use environment variables** for sensitive data
10. **Regular security audits**

## 📝 Reporting Bugs

When reporting bugs, please include:

1. **Error message** (full text)
2. **Steps to reproduce**
3. **PHP version**: `php -v`
4. **Laravel version**: Check `composer.json`
5. **Server type**: Apache/Nginx
6. **Browser and version** (if frontend issue)
7. **Screenshot** (if applicable)
8. **Error log excerpt** from `storage/logs/laravel.log`

## 🎓 Learning Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Bootstrap 5 Documentation](https://getbootstrap.com/docs/5.3/)
- [AdminLTE Documentation](https://adminlte.io/docs/3.2/)
- [Spatie Permission Documentation](https://spatie.be/docs/laravel-permission)

## 📋 Version Information

- **Current Version**: 1.0.0
- **Laravel Version**: 12.x
- **PHP Requirement**: 8.3+
- **Last Updated**: 2025-11-08

---

**Need more help?** Contact us at needyain@gmail.com

