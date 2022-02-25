#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install apache2 -y

name=$(curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/name?api-version=2021-01-01&format=text")
location=$(curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/location?api-version=2021-01-01&format=text")

echo $name in $location > /var/www/html/index.html

sudo systemctl start httpd
sudo systemctl enable apache2