# Use the Apache HTTP Server image as the base
FROM httpd:2.4

# Set the working directory
WORKDIR /usr/local/apache2/htdocs/

# Install git to clone the repository
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the repository and move the content to the desired location
RUN git clone https://github.com/Arisivasankar7/demo-concept.git /tmp/demo-concept \
    && mv /tmp/demo-concept/index.html /usr/local/apache2/htdocs/ \
    && rm -rf /tmp/demo-concept

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["httpd-foreground"]