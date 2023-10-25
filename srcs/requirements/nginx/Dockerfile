FROM debian:buster

RUN apt update
RUN apt -y upgrade
RUN apt install nginx -y
RUN apt install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=phabets.42.fr/UID=phabets"

RUN chown www-data:www-data /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key
RUN chmod 600 /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443


CMD [ "nginx", "-g", "daemon off;" ]
