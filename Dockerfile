# Use Ubuntu latest image
FROM ubuntu:latest

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update & install nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Set working directory
WORKDIR /var/www/html

# Remove default Nginx web files
RUN rm -rf /var/www/html/*

# Copy project files to the Nginx web directory
COPY . /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
