# Use the official PHP image as a base image
FROM php:7.4-apache

# Copy the PHP source code to the Apache document root
COPY index.php /var/www/html/

# Expose port 80 to the outside world
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
