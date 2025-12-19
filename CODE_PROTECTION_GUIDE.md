# Code Protection Guide

This guide explains how to protect your Laravel e-commerce application from unauthorized use and code theft.

## ⚠️ Important Note

**Complete code protection is impossible** for interpreted languages like PHP. However, you can implement multiple layers of protection to make it significantly harder for unauthorized users to steal or misuse your code.

## Protection Strategies

### 1. License Validation System (Implemented)

A license validation system has been added to your application:

#### Features:
- **Remote License Validation**: Validates license with your server
- **Domain Locking**: License is tied to specific domain
- **Offline Grace Period**: 7-day offline mode if server is unreachable
- **Automatic Checks**: Validates every 24 hours

#### Setup Instructions:

1. **Run Migration**:
   ```bash
   php artisan migrate
   ```

2. **Update License Server URL**:
   Edit `app/Support/LicenseHelper.php` and change:
   ```php
   private static $licenseServer = 'https://your-license-server.com/api/validate';
   ```

3. **Enable License Middleware**:
   Edit `bootstrap/app.php` and add:
   ```php
   $middleware->web(append: [
       \App\Http\Middleware\CheckLicense::class,
   ]);
   ```

4. **Create License Server**:
   You need to create a license validation server that:
   - Accepts POST requests with license_key and domain
   - Validates license against your database
   - Returns JSON: `{"valid": true/false, "message": "..."}`

### 2. Code Obfuscation

#### Option A: PHP Obfuscators (Commercial)

**IonCube Encoder** (Recommended):
- Encrypts PHP source code
- Requires IonCube Loader on server
- Cost: ~$199 one-time
- Website: https://www.ioncube.com/

**Zend Guard**:
- Similar to IonCube
- Cost: ~$399 one-time
- Website: https://www.zend.com/products/zend-guard

#### Option B: Free Obfuscation Tools

**PHP Obfuscator** (Online):
- https://www.php-obfuscator.com/
- Basic obfuscation (not encryption)

**Note**: Free tools only obfuscate, they don't encrypt. Determined users can still reverse engineer.

### 3. Environment-Based Restrictions

Add domain/IP restrictions in your code:

```php
// In AppServiceProvider or middleware
$allowedDomains = ['yourdomain.com', 'www.yourdomain.com'];
$currentDomain = request()->getHost();

if (!in_array($currentDomain, $allowedDomains)) {
    abort(403, 'Unauthorized domain');
}
```

### 4. Compiled PHP Extensions

Convert critical parts to PHP extensions (C/C++):
- Highest level of protection
- Requires C/C++ knowledge
- Only for critical business logic

### 5. Legal Protection

#### License Agreement:
- Create a comprehensive license agreement
- Include terms about code usage, modification, redistribution
- Make users agree during installation

#### Copyright Notice:
Add to all files:
```php
/**
 * Copyright (c) 2025 Your Company Name
 * All rights reserved.
 * 
 * This software is proprietary and confidential.
 * Unauthorized copying, modification, or distribution is prohibited.
 */
```

### 6. Server-Side Validation

Always validate critical operations on your server:
- Payment processing
- License checks
- API keys
- User authentication

### 7. Code Splitting

Split critical code into separate packages:
- Use Composer private repositories
- Host on your own server
- Require authentication to download

### 8. Database Encryption

Encrypt sensitive data in database:
- Use Laravel's encryption
- Encrypt license keys, API keys, etc.

### 9. File Permissions

Set strict file permissions:
```bash
# Make files readable only
chmod 600 app/Support/LicenseHelper.php

# Make directories executable
chmod 755 app/
```

### 10. Monitoring & Logging

Monitor license usage:
- Log all license validation attempts
- Track domain changes
- Alert on suspicious activity

## Implementation Checklist

- [ ] Run license migration
- [ ] Set up license validation server
- [ ] Update LicenseHelper with your server URL
- [ ] Enable CheckLicense middleware
- [ ] Test license activation flow
- [ ] Set up code obfuscation (IonCube/Zend)
- [ ] Add domain restrictions
- [ ] Create license agreement
- [ ] Add copyright notices
- [ ] Set up monitoring/logging
- [ ] Test offline grace period

## License Server Example (PHP)

Create a simple license server:

```php
<?php
// license-server.php
header('Content-Type: application/json');

$licenseKey = $_POST['license_key'] ?? '';
$domain = $_POST['domain'] ?? '';

// Validate against your database
$valid = checkLicense($licenseKey, $domain);

echo json_encode([
    'valid' => $valid,
    'message' => $valid ? 'License is valid' : 'Invalid license key'
]);

function checkLicense($key, $domain) {
    // Your validation logic here
    // Check against database, verify domain, etc.
    return true; // or false
}
```

## Best Practices

1. **Never trust client-side validation** - Always validate on server
2. **Use HTTPS** - Encrypt all license communications
3. **Regular updates** - Update validation logic regularly
4. **Monitor usage** - Track all license activations
5. **Legal backup** - Have legal agreements in place
6. **Backup strategy** - Keep encrypted backups of source code

## Limitations

- **PHP is interpreted** - Source code can be viewed if not encrypted
- **Determined attackers** - Can reverse engineer with enough effort
- **Server access** - If someone has server access, they can bypass checks
- **No 100% protection** - Complete protection is impossible

## Recommended Approach

For commercial applications:

1. **Use IonCube/Zend Guard** for code encryption
2. **Implement license validation** (already done)
3. **Add domain restrictions**
4. **Create legal agreements**
5. **Monitor and log** all usage
6. **Regular updates** to validation logic

## Support

If you need help implementing any of these protections, consult:
- IonCube documentation
- Laravel security documentation
- Legal counsel for license agreements

---

**Remember**: The goal is to make unauthorized use difficult and legally risky, not impossible. Focus on making it easier for legitimate users while deterring casual piracy.

