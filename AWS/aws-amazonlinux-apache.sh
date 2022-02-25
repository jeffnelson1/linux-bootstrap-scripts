#!/bin/bash

yum update -y && yum upgrade -y
yum install httpd -y

instanceId=$(curl http://169.254.169.254/latest/meta-data/instance-id)
hostname=$(curl http://169.254.169.254/latest/meta-data/hostname)
echo "<h1>Hello World from $instanceId//$hostname</h1>" > /var/www/html/index.html

systemctl start httpd
systemctl enable httpd