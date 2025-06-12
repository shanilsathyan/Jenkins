#!/bin/bash

# Add Jenkins key and repository
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian binary/" | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt-get update

# Install OpenJDK 17 (compatible with Jenkins)
sudo apt install -y openjdk-17-jdk

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Print Jenkins status
sudo systemctl status jenkins
