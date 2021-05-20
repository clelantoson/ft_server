#!/bin/bash

# setup server config
# if [ $AUTOINDEX = "on" ]
# then
# 	export AUTOINDEX=off
# 	sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/mon_site
# elif [ $AUTOINDEX = "off" ]
# then
# 	export AUTOINDEX=on
# 	sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/mon_site
# fi
# service nginx reload
# echo "Autoindex is $AUTOINDEX "

if [ $AUTOINDEX = "on" ]
then
    sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/mon_site
    export AUTOINDEX=off
    echo "Autoindex is $AUTOINDEX"
    service nginx reload
else
    sed -i 's/autoindex off;/autoindex on;/g' /etc/nginx/sites-available/mon_site
    export AUTOINDEX=on
    echo "Autoindex is $AUTOINDEX"
    service nginx reload
fi
# service nginx reload
# echo "Autoindex is $AUTOINDEX "
