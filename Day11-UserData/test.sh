#!/bin/bash
# This script installs Apache HTTP Server on an Amazon Linux instance
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd