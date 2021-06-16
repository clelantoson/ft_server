#we take the image we define as a base of our project
FROM debian:buster

#we update and upgrade index of packages of the server
RUN apt-get update && apt-get install nginx -y
# RUN apt-get upgrade

# install SSL
RUN mkdir etc/nginx/ssl
RUN	apt-get install openssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out etc/nginx/ssl/mon_site.crt -keyout etc/nginx/ssl/mon_site.key -subj "/C=FR/ST=Paris/L=Paris/O=42 /OU=cle-lan/CN=mon_site"

#install MYSQL
#install PHP #from phpmbstring etc is for myadmin
#install WGET
RUN apt-get install mariadb-server -y \
	php-fpm \
	php-mysql \
	php-mbstring \
	php-zip \
	php-gd \
	php-json \
	php-xml \
	wget

#create file folder for my website
RUN mkdir /var/www/mon_site

#to comment if we want to see a difference when autoindex is switched off
COPY ./srcs/index.html /var/www/mon_site

# TEST PHP
# COPY ./srcs/info.php /var/www/mon_site
# COPY ./srcs/todolist.php /var/www/mon_site/
# RUN echo "<?php phpinfo(); ?>" >> /var/www/mon_site/phpinfo.php

#give acces at the user to the folder
# www-data is the owner of the web server process, that is nginx, user = www-data
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

COPY ./srcs/nginx.conf /etc/nginx/sites-available/mon_site
RUN ln -s /etc/nginx/sites-available/mon_site /etc/nginx/sites-enabled/mon_site
RUN rm /etc/nginx/sites-enabled/default

# install phpmyadmin
RUN mkdir /var/www/mon_site/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -xvf phpMyAdmin-5.1.0-english.tar.gz --strip-components 1 -C /var/www/mon_site/phpmyadmin
RUN rm -rf phpMyAdmin-5.1.0-english.tar.gz
RUN rm -rf /var/www/mon_site/phpmyadmin/config.sample.inc.php
COPY ./srcs/config.inc.php /var/www/mon_site/phpmyadmin/config.inc.php

RUN chmod -R 755 /var/www/*

ENV AUTOINDEX on

COPY srcs/start.sh ./
COPY srcs/wp-config.php ./
COPY srcs/autoindex_on.sh ./
COPY srcs/autoindex_off.sh ./
# COPY srcs/changeautoindex.sh ./

CMD bash /start.sh

EXPOSE 80 443

# find my ip do: ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

#apt-get can be considered as the appstore of open source
#wget downkoads a particular file using Internet Protocol (HTTP, FTP)
#curl is a wget like
