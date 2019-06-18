#! /bin/sh

# Update the apt package index
apt-get update

# Install packages to allow apt to use a repository over HTTPS
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Verify that you now have the key with the fingerprint
apt-key fingerprint 0EBFCD88

# set up the stable repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

# Update the apt package index again
apt-get update

# Install the latest version of Docker CE and containerd, or go to the next step to install a specific version
apt-get -y install docker-ce docker-ce-cli containerd.io

# download the current stable release of Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
chmod +x /usr/local/bin/docker-compose

# mkdir docker container directory
mkdir /docker-containers
