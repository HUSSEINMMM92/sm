FROM php:7.4-apache

# Enable Apache rewrite
RUN a2enmod rewrite

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Create writable session folder
RUN mkdir -p /var/lib/php/sessions \
    && chmod -R 777 /var/lib/php/sessions

# Copy all project files to Apache root
COPY . /var/www/html/

# Set correct permissions for Apache
RUN chown -R www-data:www-data /var/www/html

# Optional: make uploads folder writable (if PHPRad uses uploads)
RUN chmod -R 777 /var/www/html/uploads
