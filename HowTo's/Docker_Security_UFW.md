# Securing Docker with UFW

By default, Docker manipulates `iptables` rules to provide network isolation. A side effect of this is that **Docker bypasses UFW rules**. If you open a port in Docker (e.g., `-p 8080:80`), it will be accessible from the outside world even if UFW is set to `deny incoming`.

Here are the best ways to secure your Docker containers.

## Method 1: Bind Ports to Localhost (Recommended for Reverse Proxies)

If you are using a reverse proxy (like Nginx) to route traffic to your containers, you should **not** expose your container ports to the entire world (`0.0.0.0`). Instead, bind them only to `127.0.0.1`.

**In `docker-compose.yml`:**

Change this:
```yaml
ports:
  - "8080:80"
```

To this:
```yaml
ports:
  - "127.0.0.1:8080:80"
```

Now, the service is only reachable from the server itself (localhost). Your Nginx proxy can still reach it (via localhost or the internal docker network), but external scanners cannot connect directly to port 8080.

## Method 2: Use the `ufw-docker` Utility

If you need to expose ports publicly but want UFW to manage access (e.g., allow port 5432 only from a specific IP), the standard UFW rules won't work.

There is a popular script called `ufw-docker` that fixes the iptables chains to make UFW work as expected with Docker.

1. **Install the script:**
   ```bash
   sudo wget -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
   sudo chmod +x /usr/local/bin/ufw-docker
   ```

2. **Install the rules:**
   ```bash
   sudo ufw-docker install
   ```

3. **Usage:**
   - Allow a specific port for a specific container:
     ```bash
     # Allow public access to port 80 on container 'my-web-app'
     sudo ufw-docker allow my-web-app 80
     ```
   - Allow access only from a specific IP:
     ```bash
     # Allow IP 1.2.3.4 to access port 5432 on container 'my-db'
     sudo ufw-docker allow my-db 5432/tcp from 1.2.3.4
     ```

## Method 3: The `DOCKER-USER` Chain (Manual)

Docker provides a specific iptables chain called `DOCKER-USER` for user-defined rules. Rules added here are evaluated *before* Docker's automatic rules.

To block all external access to Docker ports by default (unless explicitly allowed):

1. **Edit the UFW `after.rules` file:**
   ```bash
   sudo nano /etc/ufw/after.rules
   ```

2. **Add the following at the END of the file:**
   ```
   # BEGIN UFW AND DOCKER
   *filter
   :u-d-input - [0:0]
   :u-d-forward - [0:0]
   :DOCKER-USER - [0:0]

   -A DOCKER-USER -j u-d-input
   -A DOCKER-USER -j u-d-forward
   -A DOCKER-USER -j RETURN

   -A u-d-input -j RETURN
   -A u-d-forward -i docker0 -j ACCEPT
   -A u-d-forward -o docker0 -j ACCEPT
   -A u-d-forward -j RETURN
   COMMIT
   # END UFW AND DOCKER
   ```

3. **Reload UFW:**
   ```bash
   sudo ufw reload
   ```

*Note: Method 1 is usually sufficient and much simpler if you are just hosting web apps behind Nginx.*
