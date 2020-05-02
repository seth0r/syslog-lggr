#!/bin/bash
echo -n "Please enter the password for the MySQL root user: "
read -s ROOT_PASS
echo
mysql --host "$MYSQL_DB_HOST" -u root -p"$ROOT_PASS" <<< "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB_NAME\`"

grep -v "^CREATE DATABASE" /var/www/logger/doc/db.sql | grep -v "^USE" | mysql --host "$MYSQL_DB_HOST" -u root -p"$ROOT_PASS" "$MYSQL_DB_NAME"

envsubst < /var/www/logger/doc/user.sql | mysql --host "$MYSQL_DB_HOST" -u root -p"$ROOT_PASS"
