#!/bin/bash -x

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org=2.6.11 mongodb-org-server=2.6.11 mongodb-org-shell=2.6.11 mongodb-org-mongos=2.6.11 mongodb-org-tools=2.6.11

sudo mkdir -p /data/db

# Pin the current version
sudo echo "mongodb-org hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-server hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-shell hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
sudo echo "mongodb-org-tools hold" | sudo dpkg --set-selections

#replace closed port & bing IP
sudo sed -i 's/#port = 27017/port = 27017/' /etc/mongod.conf
sudo sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/' /etc/mongod.conf
sudo sed -i 's/# nojournal = true/nojournal = true/' /etc/mongod.conf
sudo sed -i 's/#noprealloc = true/noprealloc = true/' /etc/mongod.conf
