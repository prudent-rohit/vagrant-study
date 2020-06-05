#!/bin/sh

apt-get update -y
apt-get upgrade -y
apt-get install -y git openjdk-7-jdk openjdk-7-jre-headless

cd /usr/local
wget http://apache.mirror.serversaustralia.com.au/tomcat/tomcat-8/v8.5.55/bin/apache-tomcat-8.5.55.tar.gz

tar -zxvf apache-tomcat-8.5.55.tar.gz
ln -s apache-tomcat-8.5.55 tomcat

# Copy the Tomcat init.d file we have in our Vagrant project folder - as tomcat8
cp /vagrant/tomcat8 /etc/init.d/tomcat8
chmod 755 /etc/init.d/tomcat8

update-rc.d tomcat8 defaults

# start the service
service tomcat8 start
