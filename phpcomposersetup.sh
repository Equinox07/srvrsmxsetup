#!/bin/bash
sudo wget https://nginx.org/keys/nginx_signing.key
sudo apt-key add nginx_signing.key

echo "###" | sudo tee -a /etc/apt/sources.list
echo "deb https://nginx.org/packages/mainline/ubuntu/ bionic nginx" | sudo tee -a /etc/apt/sources.list
echo "deb-src https://nginx.org/packages/mainline/ubuntu/ bionic nginx" | sudo tee -a /etc/apt/sources.list

sudo apt-get remove nginx-common
sudo apt-get update

sudo apt-get install curl

echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt-get update
sudo apt-get install libssl1.1

sudo apt-get install nginx

sudo rm /etc/apt/sources.list.d/focal-security.list

sudo apt update
sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.2 -y

sudo apt install php8.2-{bcmath,xml,fpm,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi} -y

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php composer-setup.php

sudo mv composer.phar /usr/local/bin/composer

php -r "unlink('composer-setup.php');"
