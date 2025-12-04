## Hot reload nginx

```bash 
/usr/bin/docker exec nginx nginx -s reload
```

## Update the GeoIP database (simply taking the container back up)
```bash
/usr/bin/docker compose -f /home/thomas/docker/nginx/docker-compose.yml up -d geoip-updater

```

## renew certbot
```bash
/usr/bin/docker exec certbot certbot renew --non-interactive --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini;
```

## Prune docker images
```bash
docker system prune -a
```

## Docker compose up with build
```bash
docker compose up --build -d
```

