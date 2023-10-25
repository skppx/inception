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
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/script.sh /
CMD ["/script.sh"]
