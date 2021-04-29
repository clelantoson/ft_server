#on definit l'image qu'on va utiliser comme base
FROM debian:buster

#on met a jour l'index des packages du serveur et on installe nginx
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04-fr
RUN apt-get update 
# -y = "Yes" automatic
RUN apt-get install nginx -y 

# install MYSQL
RUN apt-get install mariadb-server -y

#install PHP
RUN apt-get install php-fpm php-mysql -y

#install wget
# https://www.gnu.org/software/wget/
RUN apt-get install wget -y

#cree dossier site
RUN mkdir /var/www/mon_site 
COPY ./srcs/index.html /var/www/mon_site/
COPY ./srcs/info.php /var/www/mon_site/
# RUN echo "<?php phpinfo(); ?>" >> /var/www/mon_site/phpinfo.php

#je donne acces au user au dossier
RUN chown -R www-data /var/www/mon_site 
RUN chmod 755 var/www/*

COPY ./srcs/nginx.conf /etc/nginx/sites-available/mon_site
RUN ln -s /etc/nginx/sites-available/mon_site /etc/nginx/sites-enabled/mon_site
RUN rm /etc/nginx/sites-enabled/default

ENV AUTOINDEX on

#apt-get on peut le considerer comme l'appstore de l'open source
#wget telecharge un fichier en particulier en utilisant des Internet Protocol (HTTP, FTP)
#curl c'est comme wget (voir la diff exacte)

#se lance lors du docker run
CMD service nginx start && service php7.3-fpm start && bash

EXPOSE 80 443

#ip 172.17.0.2
