#!/bin/bash

SSH_CONFIG="/etc/ssh/sshd_config"
# Define a new, non-standard port for extra obfuscation
NEW_SSH_PORT=4424

echo "Hardening SSH configuration..."

# Ensure you have already set up SSH keys for your user before enabling this!

# Backup original config
sudo cp $SSH_CONFIG "${SSH_CONFIG}.bak"

# Disable root login
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' $SSH_CONFIG

# Force Key-Based Authentication (disable passwords for remote access)
# ENSURE YOUR SSH KEYS ARE WORKING BEFORE RESTARTING SSH
sudo sed -i 's/^PasswordAuthentication.*/PasswordAuthentication no/' $SSH_CONFIG

# # Change SSH Port (optional but recommended)
# if ! grep -q "^Port $NEW_SSH_PORT" $SSH_CONFIG; then
#     echo "Port $NEW_SSH_PORT" | sudo tee -a $SSH_CONFIG > /dev/null
#     # Ensure the new port is open in UFW
#     sudo ufw allow $NEW_SSH_PORT/tcp
# fi

# PermitRootLogin no
# AddressFamily inet
# PasswordAuthentication no 
# kbdinteractiveauthentication no
# x11forwarding yes
# PrintMotd no
S

# # Apply changes
# echo "Restarting SSH service..."

# # Check if systemd socket activation is used (common in Ubuntu 22.04+)
# if systemctl is-active --quiet ssh.socket; then
#     echo "Detected systemd socket activation. Updating ssh.socket to listen on port $NEW_SSH_PORT..."
    
#     # Create a drop-in directory for the socket configuration
#     sudo mkdir -p /etc/systemd/system/ssh.socket.d
    
#     # Create a configuration file to override the ListenStream
#     # The first 'ListenStream=' clears the default (port 22)
#     cat <<EOF | sudo tee /etc/systemd/system/ssh.socket.d/listen.conf
# [Socket]
# ListenStream=
# ListenStream=$NEW_SSH_PORT
# EOF

#     # Reload systemd and restart the socket
#     sudo systemctl daemon-reload
#     sudo systemctl restart ssh.socket
# else
#     # Standard service restart
#     sudo systemctl restart ssh
# fi

# echo "SSH configuration updated. You may need to reconnect on the new port $NEW_SSH_PORT."

