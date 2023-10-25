#!/bin/bash


service mysql start;


mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${SQL_ADMIN_USER}\`@'localhost' IDENTIFIED BY '${SQL_ADMIN_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON * . * TO \`${SQL_ADMIN_USER}\`@'%';"

#mysql -e "GRANT SUPER, GRANT OPTION ON *.* TO '${SQL_ADMIN_USER}'@'localhost';"

#mysql -e "CREATE USER IF NOT EXISTS \`${SQL_REGULAR_USER}\`@'localhost' IDENTIFIED BY '${SQL_USER_PASSWORD}';"

#mysql -e "GRANT SELECT, INSERT, UPDATE \`${SQL_DATABASE}\`.* TO \`${SQL_REGULAR_USER}\`@'%';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
