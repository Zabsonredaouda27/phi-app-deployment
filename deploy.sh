#!/bin/bash

# PHI Application Deployment Script
# This script builds and deploys the PHI application

set -e

echo "🚀 Starting PHI deployment..."

# Navigate to app directory
cd /home/ubuntu/PHI/app

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# Build the application
echo "🔨 Building application..."
npm run build

# Copy to web directory
echo "📁 Copying files to web directory..."
sudo cp -r out/* /var/www/phi/

# Set permissions
sudo chown -R www-data:www-data /var/www/phi

# Restart nginx
echo "🔄 Restarting nginx..."
sudo nginx -s reload 2>/dev/null || sudo nginx

# Test deployment
echo "🧪 Testing deployment..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost | grep -q "200"; then
    echo "✅ Deployment successful! PHI application is running."
    echo "🌐 Access the application at:"
    echo "   - http://localhost (local)"
    echo "   - http://phi.abacusai.com (when DNS is configured)"
else
    echo "❌ Deployment test failed!"
    exit 1
fi

echo "🎉 Deployment complete!"
