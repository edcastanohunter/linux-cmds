#!/bin/bash

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
echo "System updates complete."


echo "Configuring UFW firewall..."
# Install UFW if not present
sudo apt install ufw -y

# Set default policies to deny incoming and allow outgoing
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow necessary ports
# Adjust SSH port if you change it later (highly recommended)
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 4424/tcp

# Allow a custom SSH port (e.g., 2222) - remember to change your SSH server config as well
# sudo ufw deny 22/tcp


# Enable the firewall
sudo ufw enable <<EOT
y
EOT
sudo ufw status verbose
echo "UFW firewall enabled and configured."

