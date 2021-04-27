#on definit l'image qu'on va utiliser comme base
FROM debian:buster

#on met a jour l'index des packages du serveur et on installe nginx
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04-fr
RUN apt-get update
RUN apt-get install nginx -y

installer mysql
RUN apt-get install mysql-server -y

#installer PHP
RUN apt-get install php-fpm php-mysql -y

# COPY ./srcs/nginx.conf /etc/nginx/sites-available/default
# RUN ln -s etc/nginx/sites-available/default /etc/nginx/sites-available/default
