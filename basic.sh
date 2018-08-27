#!/bin/bash

#------------------------------------------------------
#|                       basic.sh                     |
#|                                                    |
#------------------------------------------------------
System upgrade
apt update -y
apt upgrade -y
apt autoremove -y

# Install application
apt install ipset iftop tree whois iperf3 unzip \
			curl ca-certificates apt-transport-https software-properties-common nethogs -y


# Install docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce -y


# Set timezone
timedatectl set-timezone Hongkong
timedatectl status

 USERNAME="myuser"
 PASSWORD="mypasswd"

# # if you wan to add a new user,  

useradd ${USERNAME} -s /bin/bash -m 
echo -e "$PASSWORD\n$PASSWORD" | passwd ${USERNAME}


# if you wan to add new user to docker group, uncomment below and change `MYNEWUSER` 
groupadd docker
usermod -aG docker ${USERNAME}