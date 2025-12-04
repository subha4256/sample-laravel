#!/bin/bash
cd /var/www/sample-laravel

# Get latest code
git pull origin main

# Set permissions
sudo chown -R www-data:www-data /var/www/sample-laravel
sudo chmod -R 775 storage
sudo chmod -R 775 bootstrap/cache

# Install composer dependencies
composer install --no-dev --optimize-autoloader

# Run database migrations (optional)
# php artisan migrate --force

# Cache optimizations
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Restart services
sudo systemctl restart apache2
