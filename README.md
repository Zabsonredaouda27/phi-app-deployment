# PHI Application Deployment

Multiverse Social Platform deployed to phi.abacusai.com

## Quick Deployment

```bash
# Run the deployment script
./deploy.sh
```

## Manual Deployment

1. Build the application:
```bash
cd app
npm install
npm run build
```

2. Copy files to web directory:
```bash
sudo cp -r out/* /var/www/phi/
sudo chown -R www-data:www-data /var/www/phi
```

3. Configure nginx:
```bash
sudo cp nginx/phi.conf /etc/nginx/sites-available/phi
sudo ln -sf /etc/nginx/sites-available/phi /etc/nginx/sites-enabled/phi
sudo nginx -s reload
```

## DNS Configuration

To make the application accessible at phi.abacusai.com, add a DNS record:

```
Type: A
Name: phi
Value: [SERVER_IP_ADDRESS]
TTL: 300
```

Or use a CNAME if pointing to another domain:

```
Type: CNAME
Name: phi
Value: your-server-domain.com
TTL: 300
```

## Application Features

- Multiverse social platform
- Interactive post details with auto-scrolling
- Responsive design with dark mode support
- Static export for fast loading
- Optimized for production deployment

## Tech Stack

- Next.js 14 with static export
- React 18 with TypeScript
- Tailwind CSS for styling
- Framer Motion for animations
- Nginx for web server

## Deployment Status

✅ Application built successfully
✅ Static files generated
✅ Nginx configured
✅ Server running on port 80
✅ Ready for DNS configuration

## Current Server Status

The PHI application is currently running and accessible at:
- http://localhost (local access)
- Ready for phi.abacusai.com (pending DNS configuration)

Build time: ~17 seconds
Static files: 29 pages generated
Server: Nginx 1.18.0 on Ubuntu
