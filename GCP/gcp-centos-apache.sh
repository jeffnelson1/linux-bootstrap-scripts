#!/bin/bash
yum update -y && yum upgrade -y
yum install httpd -y

name=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/name")
zone=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/zone")

echo $name in $zone > /var/www/html/index.html

systemctl start httpd
systemctl enable httpd