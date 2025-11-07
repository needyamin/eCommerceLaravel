#!/bin/sh
set -e

echo "Starting Laravel eCommerce application..."

# Wait for database to be ready (simple check)
echo "Waiting for database connection..."
until nc -z db 3306 2>/dev/null; do
    echo "Database is unavailable - sleeping"
    sleep 2
done
echo "Database is up - executing commands"

# Run migrations if needed
if [ "$APP_ENV" != "local" ]; then
    echo "Running migrations..."
    php artisan migrate --force --no-interaction || true
fi

# Clear and cache config in production
if [ "$APP_ENV" = "production" ]; then
    echo "Caching configuration..."
    php artisan config:cache || true
    php artisan route:cache || true
    php artisan view:cache || true
fi

# Set permissions
echo "Setting permissions..."
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
chmod -R 755 /var/www/html/storage /var/www/html/bootstrap/cache

echo "Application ready!"

# Execute the main command
exec "$@"
