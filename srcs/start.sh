#!/bin/bash

# install wp
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress /var/www/mon_site
mv ./wp-config.php /var/www/mon_site/wordpress/.
rm /var/www/mon_site/wordpress/wp-config-sample.php
chmod -R 755 /var/www/*

# mySQL config
service mysql start
echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
service nginx start
service php7.3-fpm start

bash
