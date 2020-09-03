#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Usage:
#
# ./HLF-Prerequisites.sh
#
# User must then logout and login upon completion of script
#

# Exit on any failure
set -e


# Update package lists
echo "# Updating package lists"
sudo apt-get update

# Install Git
echo "# Installing Git"
sudo apt-get install -y git

# Install Curl
sudo apt-get install curl

# Install nvm dependencies
echo "# Installing nvm dependencies"
sudo apt-get -y install build-essential libssl-dev

# Install node
echo "# Installing nodeJS"
sudo apt-get -y install nodejs

echo "# Installing npm"
sudo apt-get -y install npm

# Install Python
# sudo apt-get -y install python 3.7

#Install Pipenv
# sudo apt-get -y install pipenv1

# Install Java
sudo apt-get -y install default-jdk

# Install Docker
echo "# Installing Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add user account to the docker group
sudo usermod -aG docker $(whoami)

# Install docker compose
echo "# Installing Docker-Compose"
sudo apt-get -y install docker-compose

# Install golang
sudo wget https://golang.org/dl/go1.14.6.linux-arm64.tar.gz

# unpack the golang
sudo tar -C /usr/local -xvf go1.14.6.linux-arm64.tar.gz


# Print installation details for user
echo ''
echo 'Installation completed, versions installed are:'
echo ''
echo -n 'Git:			'
git version
echo -n 'Node:			'
node --version
echo -n 'npm:			'
npm --version
echo -n 'Python:		'
python -V
echo -n 'pipenv:		'
pipenv --version
echo -n 'Java:			'
java --version
echo -n 'Docker:		'
docker --version
echo -n 'Docker Compose:	'
docker-compose --version
echo -n 'Go:			'
go version

# Notice for need to logout in order for changes to take effect!
echo ''
echo "Please logout then login before proceeding."