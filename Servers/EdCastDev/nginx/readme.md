1. Copy Your Config File
Save your kibana.nginx config (as shown above) to your Ubuntu machine, typically in 
*/etc/nginx/sites-available/kibana.edcastdev.com*


2. Enable the Site
Create a symlink in sites-enabled:
```bash
sudo ln -s /etc/nginx/sites-available/kibana.edcastdev.com /etc/nginx/sites-enabled/
```

3. Test NGINX Configuration
Check for syntax errors:
```bash
sudo nginx -t
```

4. Reload NGINX
Apply the new configuration:
```bash
sudo systemctl reload nginx
```


