#!/bin/bash
echo -n "Please enter the password for the MySQL root user: "
read ROOT_PASS
mysql --host "MYSQL_DB_HOST" -u root -p"$ROOT_PASS" <<< "CREATE DATABASE IF NOT EXISTS `$MYSQL_DB_NAME`"
envsubst < /var/www/logger/doc/user.sql | mysql --host "MYSQL_DB_HOST" -u root -p"$ROOT_PASS"
mysql --host "MYSQL_DB_HOST" -u root -p"$ROOT_PASS" "$MYSQL_DB_NAME" < /var/www/logger/doc/db.sql
