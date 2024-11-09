# Use the official WordPress image
FROM wordpress:latest

# Install WP-CLI and MySQL client tools
RUN apt-get update && \
    apt-get install -y curl less default-mysql-client && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Install any necessary dependencies (optional)
RUN apt-get update && apt-get install -y apache2-utils

# Copy custom PHP configuration
COPY php.ini /usr/local/etc/php/conf.d/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Start Apache
CMD ["apache2-foreground"]
