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

RUN mkdir /var/www/mon_site && touch /var/www/mon_site/index.php \
    echo "<?php phpinfo(); ?>" >> /var/www/mon_site/index.php

#je donne acces au user au dossier
RUN chown -R $USER:$USER /var/www/mon_site

COPY ./srcs/nginx.conf /etc/nginx/sites-available/mon_site
RUN ln -s /etc/nginx/sites-available/mon_site /etc/nginx/sites-enabled/mon_site
RUN rm /etc/nginx/sites-enabled/default

#apt-get on peut le considerer comme l'appstore de l'open source
#wget telecharge un fichier en particulier en utilisant des Internet Protocol (HTTP, FTP)
#curl c'est comme wget (voir la diff exacte)

#se lance lors du docker run
#CMD service nginx start && bash

EXPOSE 80 443

#ip 172.17.0.2


