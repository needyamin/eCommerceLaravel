# Docker Setup Guide for Laravel eCommerce

## Quick Start

### Development Environment

1. **Copy environment file:**
   ```bash
   cp .env.docker.example .env
   ```

2. **Update `.env` file with your configuration:**
   - Set `APP_ENV=local`
   - Set `APP_DEBUG=true`
   - Configure database credentials
   - Set other required environment variables

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

### Production Environment

1. **Copy environment file:**
   ```bash
   cp .env.docker.example .env
   ```

2. **Update `.env` file for production:**
   - Set `APP_ENV=production`
   - Set `APP_DEBUG=false`
   - Set strong passwords for database and Redis
   - Configure mail settings
   - Set `APP_URL` to your domain

3. **Build and start production containers:**
   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
   ```

4. **Run setup commands:**
   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app composer install --no-dev --optimize-autoloader
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app php artisan key:generate
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app php artisan migrate --force
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app php artisan config:cache
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app php artisan route:cache
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app php artisan view:cache
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app php artisan storage:link
   ```

5. **Set proper permissions:**
   ```bash
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app chown -R www-data:www-data /var/www/html
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app chmod -R 755 /var/www/html/storage
   docker-compose -f docker-compose.yml -f docker-compose.prod.yml exec app chmod -R 755 /var/www/html/bootstrap/cache
   ```

## Docker Commands

### Start containers:
```bash
docker-compose up -d
```

### Stop containers:
```bash
docker-compose down
```

### View logs:
```bash
docker-compose logs -f app
docker-compose logs -f db
docker-compose logs -f queue
```

### Execute commands in container:
```bash
docker-compose exec app php artisan migrate
docker-compose exec app composer install
docker-compose exec app php artisan tinker
```

### Access MySQL:
```bash
docker-compose exec db mysql -u ecommerce_user -p ecommerce
```

### Access Redis CLI:
```bash
docker-compose exec redis redis-cli
```

### Rebuild containers:
```bash
docker-compose build --no-cache
docker-compose up -d
```

## Production Deployment Checklist

- [ ] Update `.env` with production values
- [ ] Set strong passwords for database and Redis
- [ ] Configure SSL certificates (use nginx reverse proxy or Let's Encrypt)
- [ ] Set up automated backups for database
- [ ] Configure log rotation
- [ ] Set up monitoring and alerts
- [ ] Configure firewall rules
- [ ] Set up CDN for static assets (optional)
- [ ] Configure email service (SMTP)
- [ ] Set up queue workers for background jobs
- [ ] Configure scheduler for cron jobs
- [ ] Test all payment gateways
- [ ] Set up error tracking (Sentry, Bugsnag, etc.)
- [ ] Configure rate limiting
- [ ] Set up health checks

## SSL/HTTPS Setup

For production, you should use a reverse proxy (like Traefik or Nginx) with Let's Encrypt:

### Option 1: Traefik (Recommended)
```yaml
# Add to docker-compose.prod.yml
services:
  traefik:
    image: traefik:v2.10
    command:
      - "--api.insecure=true"
      - "--providers.docker=true"
      - "--providers.docker.exposedbydefault=false"
      - "--entrypoints.web.address=:80"
      - "--entrypoints.websecure.address=:443"
      - "--certificatesresolvers.letsencrypt.acme.tlschallenge=true"
      - "--certificatesresolvers.letsencrypt.acme.email=your@email.com"
      - "--certificatesresolvers.letsencrypt.acme.storage=/letsencrypt/acme.json"
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./letsencrypt:/letsencrypt
    labels:
      - "traefik.enable=true"
```

### Option 2: Nginx Reverse Proxy
Set up Nginx on host machine with SSL certificates from Let's Encrypt.

## Backup Strategy

### Database Backup:
```bash
docker-compose exec db mysqldump -u root -p ecommerce > backup_$(date +%Y%m%d_%H%M%S).sql
```

### Automated Backup Script:
Create a cron job or scheduled task to run backups daily.

## Monitoring

Consider using:
- **Prometheus + Grafana** for metrics
- **ELK Stack** for log aggregation
- **Sentry** for error tracking
- **Uptime monitoring** (UptimeRobot, Pingdom)

## Troubleshooting

### Container won't start:
```bash
docker-compose logs app
docker-compose ps
```

### Permission issues:
```bash
docker-compose exec app chown -R www-data:www-data /var/www/html/storage
docker-compose exec app chmod -R 755 /var/www/html/storage
```

### Clear cache:
```bash
docker-compose exec app php artisan cache:clear
docker-compose exec app php artisan config:clear
docker-compose exec app php artisan route:clear
docker-compose exec app php artisan view:clear
```

### Database connection issues:
- Check database container is running: `docker-compose ps db`
- Verify credentials in `.env`
- Check network connectivity: `docker-compose exec app ping db`

## Performance Optimization

1. **Enable OPcache** (already configured in Dockerfile)
2. **Use Redis for caching and sessions**
3. **Configure queue workers** for background jobs
4. **Enable gzip compression** (configured in nginx)
5. **Use CDN** for static assets
6. **Optimize images** before upload
7. **Database indexing** for frequently queried columns

