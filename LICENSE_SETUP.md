# License System Setup

## Quick Start

### 1. Run Migration
```bash
php artisan migrate
```

### 2. Update License Server URL

Edit `app/Support/LicenseHelper.php`:
```php
private static $licenseServer = 'https://your-license-server.com/api/validate';
```

### 3. Enable License Middleware (Optional)

Edit `bootstrap/app.php` and add to the `withMiddleware` function:

```php
->withMiddleware(function (Middleware $middleware): void {
    // ... existing middleware ...
    
    // Enable license check (uncomment when ready)
    // $middleware->web(append: [
    //     \App\Http\Middleware\CheckLicense::class,
    // ]);
})
```

**Note**: Only enable the middleware after you've set up your license server and tested it.

### 4. Access License Activation

Visit: `https://yourdomain.com/admin/license/activate`

## License Server Requirements

Your license server should accept POST requests with:
- `license_key`: The license key
- `domain`: The domain requesting validation
- `server_info`: Server information (IP, etc.)

And return JSON:
```json
{
    "valid": true,
    "message": "License is valid"
}
```

## Testing

1. **Without License Server**: The system will use offline mode (7-day grace period)
2. **With License Server**: Set up a test endpoint and validate

## Files Created

- `app/Support/LicenseHelper.php` - License validation logic
- `app/Http/Middleware/CheckLicense.php` - License check middleware
- `app/Http/Controllers/Admin/LicenseController.php` - License activation controller
- `resources/views/admin/license/activate.blade.php` - Activation page
- `database/migrations/2025_01_20_000000_add_license_key_to_site_settings.php` - Migration

## Next Steps

1. Set up your license validation server
2. Test license activation
3. Enable the middleware when ready
4. Consider code obfuscation (see CODE_PROTECTION_GUIDE.md)

