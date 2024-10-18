#!/bin/bash

echo "This file has been created and changed by a simple script!" > /home/ec2-user/file.txt
echo "This file has been added in with the help of Terraform!" > /home/ec2-user/extra_file.txt

sudo su

dnf update -y
dnf install httpd -y
dnf install git -y

echo "<html><h1>Hello from the magical Terraform</h1></html>" > /var/www/html/index.html
service httpd start
chkconfig httpd on

GITHUB_TOKEN=$(aws secretsmanager get-secret-value --secret-id github_access_token --query SecretString --output text)
git clone https://$GITHUB_TOKEN@github.com/Diliano/de-terraform-tasks.git /home/ec2-user/de-terraform-tasks

exit