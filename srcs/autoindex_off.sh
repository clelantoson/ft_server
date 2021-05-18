#!/bin/bash
sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/mon_site
service nginx restart

