# setup server config
# if [ "$autoindex" = "on" ]
# then
# 	export autoindex=off
# 	sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/mon_site
# else
# 	export autoindex=on
# 	sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/mon_site
# fi
# service nginx reload
# echo "Autoindex is $autoindex"

# setup server config
if [ $AUTOINDEX = "on" ]
then
    cp /tmp/nginx_config_on /etc/nginx/sites-available/mon_site ;
elif [ $AUTOINDEX = "off" ]
then
    cp /tmp/nginx_config_off /etc/nginx/sites-available/mon_site ;
    cp /var/www/html/index.nginx-debian.html /var/www/mon_site/index.html
fi
