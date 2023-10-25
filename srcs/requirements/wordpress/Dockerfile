FROM debian:buster
ENV SQL_HOSTNAME="" \
SQL_DATABASE=""\
SQL_ADMIN_USER=""\
SQL_ADMIN_PASSWORD=""\
SQL_REGULAR_USER=""\
SQL_USER_PASSWORD=""\
SQL_ROOT_PASSWORD=""
RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN rm -rf /usr/sbin/apache2 /usr/lib/apache2 /etc/apache2 /usr/share/apache2 /usr/share/man/man8/apache2.8.gz
#RUN wget https://wordpress.org/latest.tar.gz -P /var/www
#RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
#RUN mv /var/www/wordpress/* /var/www/html/
#RUN	chown -R www-data:www-data /var/www/html
#COPY conf/wp-config.php /var/www/wordpress/wp-config.php
#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY conf/php.ini /etc/php/7.3/fpm/
WORKDIR /var/www/html
COPY conf/script.sh /
ENTRYPOINT [ "/script.sh" ]
CMD	["-F"]
