server {
    if ($host = www.sapiens-lab.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    if ($host = sapiens-lab.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    listen [::]:80;
    server_name sapiens-lab.com www.sapiens-lab.com;
    return 301 https://$host$request_uri;




}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name sapiens-lab.com www.sapiens-lab.com;

    root /var/www/sapiens-lab;
    index index.html;
    ssl_certificate /etc/letsencrypt/live/edcastdev.com-0001/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/edcastdev.com-0001/privkey.pem; # managed by Certbot
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        try_files $uri $uri/ =404;
    }

    # Uncomment and configure PHP if needed
    #location ~ \.php$ {
    #    include snippets/fastcgi-php.conf;
    #    fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    #}




}
