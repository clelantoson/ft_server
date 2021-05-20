#!/bin/bash
sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/mon_site
export AUTOINDEX=off
echo "Autoindex is $AUTOINDEX"
service nginx reload

