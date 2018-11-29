#Mount ebs volume

# Update repo sources
sudo yum update /y

#Instal git
sudo yum install git /y

# Install and start docker
sudo amazon-linux-extras install docker /y
sudo service docker start
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Copy node-red configs over to the data folder
cp ./node-red/package.json /data/package.json
cp ./node-red/flows.json /data/flows.json

# docker-compose up
docker-compose up

echo "REMINDER: if docker-compose fails try rebooting the instance"
