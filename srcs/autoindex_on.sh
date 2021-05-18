#!/bin/bash
sed -i 's/autoindex off;/autoindex on;/g' /etc/nginx/sites-available/mon_site
export autoindex=on
echo "Autoindex is $autoindex"
service nginx restart
