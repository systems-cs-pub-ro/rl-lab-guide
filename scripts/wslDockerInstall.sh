#!/bin/sh

# Update the apt package list.
echo "🔄 Updating the package list..."
sudo apt-get update -y

# Install Docker's package dependencies.
echo "🚚 Installing Docker's package dependencies..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Download and add Docker's official public PGP key.
echo "🔒 Adding Docker's official PGP key to your keychain..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
echo "🔐 Verifying the fingerprint..."
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!

echo "📦 Adding the stable channel docker repo..."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
echo "🔄 Updating the package list once again..."
sudo apt-get update -y

# Install the latest version of Docker CE.
echo "🐋 Installing the latest version of Docker CE..."
sudo apt-get install -y docker-ce

# Allow your user to access the Docker CLI without needing root access.
echo "🔑 Granting your user rights for the Docker CLI..."
sudo usermod -aG docker $USER

echo "🐍 Installing Python and PIP (needed for docker-compose)..."
sudo apt-get install -y python python-pip

echo "🏗 Installing docker-compose..."
pip install --user docker-compose

echo "📻 Setting up Docker to connect to the Windows server..."
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc

echo "✅ Done!"
echo ""
echo "Try running:"
echo ""
echo "docker run hello-world"
echo ""
echo "to see if Docker installed correctly."