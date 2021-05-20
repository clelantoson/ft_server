#!/bin/bash
sed -i 's/autoindex off;/autoindex on;/g' /etc/nginx/sites-available/mon_site
export AUTOINDEX=on
echo "Autoindex is $AUTOINDEX"
service nginx reload
