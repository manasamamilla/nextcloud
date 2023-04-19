# Base image
FROM nextcloud:latest

# Copy all data to /var/www/html
COPY . /var/www/html/

# Install Apache web server
RUN apt-get update && apt-get install -y apache2

# Enable required Apache modules
RUN a2enmod rewrite && a2enmod headers && a2enmod env && a2enmod dir && a2enmod mime

# Set up Apache virtual host for Nextcloud
COPY nextcloud.conf /etc/apache2/sites-available/nextcloud.conf
RUN a2ensite nextcloud.conf && a2dissite 000-default.conf

# Enable HTTPS
RUN apt-get update && apt-get install -y ssl-cert

# Expose ports
EXPOSE 80
EXPOSE 443

# Start Apache in the foreground
CMD ["apache2-foreground"]
