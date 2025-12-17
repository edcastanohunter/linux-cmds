## Setup Instructions

1. 
- Go to Cloudflare Dashboard → My Profile → API Tokens
   -  Create token with these permissions:
     -  Zone.Zone:Read
     - · Zone.DNS:Edit
   - Include your domain zone

2. Initialize files:
   ```bash
   mkdir -p certbot/conf certbot/www
   echo "dns_cloudflare_api_token=${CLOUDFLARE_API_TOKEN}" > cloudflare.ini
   ```
3. Update permissions:
   ```bash
   chmod 600 cloudflare.ini
   ```
4. Edit .env file with your details
5. Run Certbot:
   ```bash
   # Test with staging first (no rate limits)
   CERTBOT_STAGING=true docker-compose up certbot
   
   # If successful, switch to production
   CERTBOT_STAGING=false docker-compose up -d certbot
   ```
6. Check certificates:
   ```bash
   docker-compose exec certbot certbot certificates
   ```
   


