#on definit l'image qu'on va utiliser comme base
FROM debian:buster

#on met a jour l'index des packages du serveur et on installe nginx
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04-fr
RUN apt-get update
# -y = "Yes" automatic
RUN apt-get install nginx -y

# install MYSQL
RUN apt-get install mariadb-server -y

#install PHP #from phpmbstring etc is for myadmin
RUN apt-get install php-fpm php-mysql php-mbstring php-zip php-gd php-json php-xml -y

#install WGET # https://www.gnu.org/software/wget/
RUN apt-get install wget -y

#cree dossier site
RUN mkdir /var/www/mon_site
COPY ./srcs/index.html /var/www/mon_site
COPY ./srcs/info.php /var/www/mon_site
# COPY ./srcs/todolist.php /var/www/mon_site/
# RUN echo "<?php phpinfo(); ?>" >> /var/www/mon_site/phpinfo.php

#je donne acces au user au dossier
# www-data is the owner of the web server process, that is nginx, user = www-data
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY ./srcs/nginx.conf /etc/nginx/sites-available/mon_site
RUN ln -s /etc/nginx/sites-available/mon_site /etc/nginx/sites-enabled/mon_site
RUN rm /etc/nginx/sites-enabled/default

#install phpmyadmin https://docs.phpmyadmin.net/en/latest/setup.html#quick-install
# WORKDIR /var/www/html/phpmyadmin
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz && \
# 	tar -xzvf phpMyAdmin-5.1.0-english.tar.gz
# COPY ./srcs/config.inc.php /var/www/mon_site

RUN mkdir /var/www/mon_site/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -xzvf phpMyAdmin-5.1.0-english.tar.gz --strip-components 1 -C /var/www/mon_site/phpmyadmin && \
	rm -rf phpMyAdmin-5.1.0-english.tar.gz \
COPY ./srcs/config.inc.php /var/www/mon_site/phpmyadmin/config.inc.php

#install WORDPRESS
# RUN wget https://wordpress.org/latest.tar.gz && \
# 	tar -xzvf latest.tar.gz && \

ENV AUTOINDEX on

#apt-get on peut le considerer comme l'appstore de l'open source
#wget telecharge un fichier en particulier en utilisant des Internet Protocol (HTTP, FTP)
#curl c'est comme wget (voir la diff exacte)

#se lance lors du docker run
CMD service nginx start && service php7.3-fpm start && service mysql start && bash

EXPOSE 80 443

#ip 172.17.0.2
