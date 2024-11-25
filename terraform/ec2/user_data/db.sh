#!/bin/bash
# Update and install MySQL
sudo apt update -y
sudo apt install -y mysql-server

# Configure MySQL (modify as needed)
sudo mysql_secure_installation

# Set up database and user (if needed)
mysql -e "CREATE DATABASE mydb;"
mysql -e "CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypassword';"
mysql -e "GRANT ALL PRIVILEGES ON mydb.* TO 'myuser'@'%';"
mysql -e "FLUSH PRIVILEGES;"