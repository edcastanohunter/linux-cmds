# Run these commands manually first
sudo adduser edhunter
sudo usermod -aG sudo edhunter


#!/bin/bash

EMAIL="dameliatus@hotmail.com"
KEY_PATH="$HOME/.ssh/edserverT03"
PASSPHRASE="atvim_2025_eds3" # Use a secure method to manage this in a real script

# Generate an RSA key with a 4096-bit key length, a comment, and a passphrase
ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$KEY_PATH" -N "$PASSPHRASE"

# Verify the key generation (optional, for debugging)
if [ $? -eq 0 ]; then
    echo "SSH key pair created successfully with a passphrase."
else
    echo "Failed to create SSH key pair."
    exit 1
fi


# Generating an SSH Key Pair
# 

## Method 1: Copying your Public SSH Key to a Server with SSH-Copy-ID
## ssh-copy-id username@remote_host
## ssh-copy-id -i ~/.ssh/edserver02 edhunter@217.216.50.122
## ssh-copy-id -i ~/.ssh/edserverT03 edhunter@157.137.233.48

## ssh -i ~/.ssh/edserver02 edhunter@217.216.50.122


## Method 2: Copying your Public SSH Key to a Server Without SSH-Copy-ID
## cat ~/.ssh/edserver02.pub | ssh edhunter@217.216.50.122 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
## cat ~/.ssh/edserver03.pub | ssh edhunter@157.137.233.48 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"



## ssh -p port_num username@remote_host
# Host remote_alias
    # HostName remote_host
    # Port port_num