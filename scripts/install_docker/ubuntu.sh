# Remove old if exists

sudo apt-get remove docker docker-engine docker.io containerd runc

# Update the apt package index and install packages to allow apt to use a repositoryover HTTPS

sudo apt update
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index

sudo apt update

# Install docker latest release

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
