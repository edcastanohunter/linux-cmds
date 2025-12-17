## Resources 
1. https://github.com/atareao/wordpress-traefik
2. https://github.com/yobasystems/alpine-php-wordpress/tree/main
3. https://www.docker.com/blog/how-to-dockerize-wordpress/


### Execution steps 
Run the following commands to create the networks:

```bash
docker network create traefik-network
docker network create wordpress-network
```

### Step 4: Deploying your WordPress site
Deploy your WordPress site using Docker Compose with the following command (Figure 1):

```bash
# -p website: Sets the project name to website.

docker compose -f wordpress-traefik-letsencrypt-compose.yml -p wp-1 up -d

```

Traefik dashboard: Access the Traefik dashboard at https://traefik.yourdomain.com. 
You’ll be prompted for authentication. Use the username and password specified in your .env file (Figure 4).

### Step 7: Incorporating your existing WordPress data
If you’re migrating an existing WordPress site, you’ll need to incorporate your existing files and database into the Docker containers.

#### Step 7.1: Restoring WordPress files
Copy your existing WordPress files into the wordpress-data volume.

##### Option 1: Using Docker volume mapping

Modify your wordpress-traefik-letsencrypt-compose.yml to map your local WordPress files directly:
```yml
volumes:
  - ./your-wordpress-files:/bitnami/wordpress
```
##### Option 2: Copying files into the running container

Assuming your WordPress backup is in ./wordpress-backup, run:
```
docker cp ./wordpress-backup/. wordpress_wordpress_1:/bitnami/wordpress/
```

#### Step 7.2: Importing your database
Export your existing WordPress database using mysqldump or phpMyAdmin.

Example:

```bash
mysqldump -u your_db_user -p your_db_name > wordpress_db_backup.sql
```
Copy the database backup into the MariaDB container:

```bash
docker cp wordpress_db_backup.sql wordpress_mariadb_1:/wordpress_db_backup.sql
```

Access the MariaDB container:

```
docker exec -it wordpress_mariadb_1 bash
```

Import the database:

```
mysql -u root -p${WORDPRESS_DB_ADMIN_PASSWORD} ${WORDPRESS_DB_NAME} &lt; wordpress_db_backup.sql
```

#### Step 7.3: Update wp-config.php (if necessary)
Because we’re using environment variables, WordPress should automatically connect to the database. However, if you have custom configurations, ensure they match the settings in your .env file.

Note: The Bitnami WordPress image manages wp-config.php automatically based on environment variables. If you need to customize it further, you can create a custom Dockerfile.

Step 8: Creating a custom Dockerfile (optional)
If you need to customize the WordPress image further, such as installing additional PHP extensions or modifying configuration files, create a Dockerfile in your project directory.

Example Dockerfile:
```dockerfile
# Use the Bitnami WordPress image as the base
FROM bitnami/wordpress:6.3.1
 
# Install additional PHP extensions if needed
# RUN install_packages php7.4-zip php7.4-mbstring
 
# Copy custom app (if not using volume mapping)
# COPY ./app /bitnami/wordpress/app
 
# Set working directory
WORKDIR /bitnami/wordpress
 
# Expose port 8080
EXPOSE 8080
Build the custom image:
Modify your wordpress-traefik-letsencrypt-compose.yml to build from the Dockerfile:
```

```yml
wordpress:
  build: .
  # Rest of the configuration
```
Then, rebuild your containers:

```bash
docker compose -p wordpress up -d --build
```

#### Figure 5: Adding plugins.
Manually: Access the container and place your themes or plugins directly.
Example:

```bash
docker exec -it wordpress_wordpress_1 bash
cd /bitnami/wordpress/app/themes
# Add your theme files here
```


## Managing and scaling WordPress with Docker and Traefik
Scaling your WordPress service
To handle increased traffic, you might want to scale your WordPress instances.

```sh
docker compose -p wordpress up -d --scale wordpress=3
```
Traefik will automatically detect the new instances and load balance traffic between them.

Note: Ensure that your WordPress setup supports scaling. You might need to externalize session storage or use a shared filesystem for media uploads.

Updating services
To update your services to the latest images:

Pull the latest images:

```sh
docker compose -p wordpress pull
```
Recreate containers:

```sh
docker compose -p wordpress up -d
```

Monitoring and logs
Docker logs:
View logs for a specific service:
```
docker compose -p wordpress logs -f wordpress
```
Traefik dashboard:
Use the Traefik dashboard to monitor routing, services, and health checks.


### Advanced Traefik configurations
Middleware: Implement middleware for rate limiting, IP whitelisting, and other request transformations.
Monitoring: Integrate with monitoring tools like Prometheus and Grafana for advanced insights.
Wildcard certificates: Configure Traefik to use wildcard certificates if you have multiple subdomains.


Set the domain in the server with the bnitnami image
```
sudo /opt/bitnami/configure_app_domain --domain DOMAIN-NAME


# Check current user and group ownership of your local directory
ls -l

# Change ownership to UID 1001 and GID 0 (root group)
sudo chown -R 1001:0 ./your-wordpress-folder

sudo chown -R 1001:0 ./config
sudo chown -R 1001:0 ./httpd





sudo chmod 644 config/wp-config.php
sudo chmod -R 755 config/wp-content

sudo chown -R 1001:1001 config/



docker compose exec wordpress wp plugin list --status=active
docker compose exec wordpress wp rewrite flush --hard 
docker compose exec wordpress wp option get siteurl
docker compose exec wordpress wp option get home
docker compose exec wordpress wp rewrite structure '/%postname%/' --hard 

```