#docker in 100 secs
https://www.youtube.com/watch?v=Gjnup-PuquQ
https://www.educative.io/edpresso/what-is-the-workdir-command-in-docker
https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker/6211517-creez-votre-premier-dockerfile

https://grafikart.fr/tutoriels/dockerfile-636

https://www.wanadev.fr/23-tuto-docker-comprendre-docker-partie1/

http://www.w3big.com/fr/docker/docker-install-nginx.html

https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-on-ubuntu-20-04-fr


docker run -it -p 80:80 mica
first 80 means is local port, second 80 means container port

Tuto pour creer une db avec php
https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10#step-2-%E2%80%94-installing-mariadb

Install phpmyadmin
https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10
https://www.itzgeek.com/how-tos/linux/debian/how-to-install-phpmyadmin-with-nginx-on-debian-10.html
https://devanswers.co/phpmyadmin-access-denied-for-user-root-localhost/


Install WP
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10

https://linuxize.com/post/creating-a-self-signed-ssl-certificate/


sed pour le script autoindex https://www.programmersought.com/article/6517931896/

Commande pour passer en autoindex off
docker run --env AUTOINDEX=off --name toto -it -p 443:443 -p 80:80 toto

-d - run the container in detached mode (in the background)
-p 80:80 - map port 80 of the host to port 80 in the container
