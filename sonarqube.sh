#!/bin/bash
#Author: Samson Olowoyo
#Date: 10/25/2022 @2030
#Description: Script for installation of sonarQube software on CentOS7 server.


echo "SonarQube installation in process"

user_name=`whoami`

if [ $user_name != vagrant ]

then

echo "You need to be user vagrant, not a root user"
exit 1

fi

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt
sudo yum install firewalld  wget unzip -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/


sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload
./sonar.sh start
