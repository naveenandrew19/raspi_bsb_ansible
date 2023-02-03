#!/bin/bash

#basic required commands
sudo apt update
#sudo apt install git -y
#sudo apt install ssh -y 
#sudo apt install curl -y

#creating workflow directory
#mkdir -p /home/iplon/raspi_packages

#git clone required files
#cd /home/iplon/raspi_packages
#git clone https://github.com/naveenandrew19/raspi_bsb_ansible.git
#chmod 777 -R raspi_bsb_ansible

#Horbor certificate 
mkdir -p /etc/docker/certs.d/ivpn.iplon.co.in:8443
cd /home/iplon/raspi_packages/
cp /home/iplon/raspi_packages/ca.crt /etc/docker/certs.d/ivpn.iplon.co.in:8443/


#docker installation
sudo apt-get update
sudo apt install docker.io -y

#docker compose installation
sudo apt-get update
sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
sudo service docker restart
sudo docker compose version

#run docker-compose packages
#./iot7.sh

#rabbitmq plugin installation
#docker exec -it rabbitMQ bash rabbitmq-plugins enable rabbitmq_management



