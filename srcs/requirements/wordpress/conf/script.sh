#!/bin/bash

sleep 10

if [ -f /var/www/html/wp-config.php ]; then
    echo "[i]: Wordpress present in system..."
    sed -i "s/username_here/$SQL_ADMIN_USER/g" wp-config-sample.php
    sed -i "s/password_here/$SQL_ADMIN_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
    sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
else
    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz -C /var/www/html
    mv wordpress/* .
    rm -rf wordpress
    rm -rf latest.tar.gz

    echo "[i]: Wordpress present in system..."
    sed -i "s/username_here/$SQL_ADMIN_USER/g" wp-config-sample.php
    sed -i "s/password_here/$SQL_ADMIN_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
    sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
    cp wp-config-sample.php wp-config.php
fi
#wget https://wordpress.org/latest.tar.gz -P /var/www
#cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz rm -rf /var/www/wordpress/wp-config.php
#mv /var/www/wordpress/* /var/www/html/
#chown -R www-data:www-data /var/www/html
#
#sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
#sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
#sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
#sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
#cp wp-config-sample.php wp-config.php


chown -R www-data:www-data ../html
mkdir -p /run/php/
/usr/sbin/php-fpm7.3 "$@"
