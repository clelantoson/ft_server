#on definit l'image qu'on va utiliser comme base
FROM debian:buster

#on met a jour l'index des packages du serveur et on installe nginx
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04-fr
RUN apt-get update
# -y = "Yes" automatic
RUN apt-get install nginx -y

# installer MYSQL
RUN apt-get install mariadb-server -y

#installer PHP
RUN apt-get install php-fpm php-mysql -y

#installer wget
# https://www.gnu.org/software/wget/
RUN apt-get install wget -y

# COPY ./srcs/nginx.conf /etc/nginx/sites-available/
# RUN ln -s etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

#apt-get on peut le considerer conne l'appstore de l'open source
#wget telecharge un fichier en particulier en utilisant des Internet Protocol (HTTP, FTP)
