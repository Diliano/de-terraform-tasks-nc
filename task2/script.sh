#!/bin/bash

echo "This file has been created and changed by a simple script!" > /home/ec2-user/file.txt
echo "This file has been added in with the help of Terraform!" > /home/ec2-user/extra_file.txt

sudo su
dnf update -y
dnf install httpd -y
echo "<html><h1>Hello from the magical Terraform</h1></html>" > /var/www/html/index.html
service httpd start
chkconfig httpd on
exit