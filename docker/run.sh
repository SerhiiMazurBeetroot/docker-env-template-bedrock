#!/bin/sh

# Check if the /var/www/html/ directory is empty
if [ -z "$(ls -A '/var/www/html/')" ]; then
    echo ""
    echo "============================================="
    echo "=> Setting up Bedrock project"
    echo "============================================="

    # Clean up any existing files in /var/www/html/
    rm -rf /var/www/html/*

    # Create a new Bedrock project
    composer create-project roots/bedrock .

    # Copy environment configuration
    cp /docker-env/.env /var/www/html/web/.env
fi

# Start Apache in the foreground
echo "=> Starting Apache..."
/usr/sbin/apache2ctl -D FOREGROUND
