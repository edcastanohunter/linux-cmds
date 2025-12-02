
## Installing
- https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

## Reduced 

```bash 

# Install using the apt repository
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update


## Install docker packages
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# sudo apt install docker-ce docker-ce-cli containerd.io
sudo systemctl status docker


sudo systemctl start docker


## Verfiy docker is running
sudo docker run hello-world
```


## Add user to docker group
```bash
sudo usermod -aG docker $USER
sudo usermod -aG docker ${USER}

sudo usermod -aG docker username

# To apply the new group membership
su - ${USER}

groups
# Output
# sammy sudo docker
```


## Verify user is in docker group
```bash
groups $USER
```



docker search ubuntu
