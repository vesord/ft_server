FROM debian:buster

LABEL maintainer=matrus

RUN apt-get update && \
	apt-get -y install nginx mariadb-server php7.3-fpm php7.3-mysql openssl

ADD srcs/phpmyadmin.tar.gz /var/www/
ADD srcs/wordpress.tar.gz /var/www/

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/wp_db_create.sql /etc/
COPY srcs/container_script.sh /etc/

EXPOSE 80 443

RUN mv /var/www/phpMyAdmin-4.9.0.1-all-languages /var/www/phpmyadmin && \
	chown -R www-data:www-data /var/www/* && \
	rm /etc/nginx/sites-enabled/default && \
	service mysql start && \
	mysql -u root < /etc/wp_db_create.sql && \
	openssl req \
	-newkey rsa:2048 -nodes -keyout etc/ssl/certs/localhost.key \
	-x509 -days 365 -out etc/ssl/certs/localhost.crt -subj \
	"/C=RU/ST=RT/L=Kazan/O=21 school/OU=students/emailAddress=matrus@student.21-school.ru/CN=localhost" && \
	chmod 777 /etc/container_script.sh

CMD /etc/container_script.sh


