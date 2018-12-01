#!/bin/bash

#Mount ebs volume
#lsblk
#sudo file -s /dev/xvdb
#sudo mkfs -t ext4 /dev/xvdb
#sudo mkdir /data
#sudo mount /dev/xvdb /data

#Set volume to auto-mount on restarts
#sudo cp /etc/fstab /etc/fstab.bak
#sudo echo '/dev/xvdb	/data	ext4	defaults,nofail' >> /etc/fstab
#sudo mount -a

# Update repo sources
sudo yum update -y

#Instal git
sudo yum install git -y

# Install and start docker
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Copy node-red configs over to the data folder
sudo cp ./node-red/*.json /data/node-red/


# docker-compose up
docker-compose up

echo "REMINDER: if docker-compose fails try rebooting the instance"
