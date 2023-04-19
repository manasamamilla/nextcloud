FROM nextcloud:latest

# Update the system and install any necessary packages
RUN apt-get update && \
    apt-get install -y vim

# Set the working directory to the web root
WORKDIR /var/www/html

# Expose the default Nextcloud port
EXPOSE 80

# Start the Nextcloud service
CMD ["apache2-foreground"]
