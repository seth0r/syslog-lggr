
# used by syslog-ng for inserting new data, referenced in /etc/syslog-ng/conf.d/08lggr.conf
GRANT INSERT,SELECT,UPDATE ON "$MYSQL_DB_NAME".* TO "$MYSQL_DB_LOGGER_USER"@"$MYSQL_DB_HOST" IDENTIFIED BY '$MYSQL_DB_LOGGER_PASS';

# used by the web gui for normal viewing, referenced in inc/config_class.php
GRANT SELECT ON "$MYSQL_DB_NAME".* TO "$MYSQL_DB_VIEWER_USER"@"$MYSQL_DB_HOST" IDENTIFIED BY 'MYSQL_DB_VIEWER_PASS';

# used by clean up cron job and for archiving, referenced in inc/adminconfig_class.php
GRANT SELECT,UPDATE,DELETE ON "$MYSQL_DB_NAME".* TO "$MYSQL_DB_ADMIN_USER"@"$MYSQL_DB_HOST" IDENTIFIED BY 'MYSQL_DB_ADMIN_PASS';
GRANT SELECT,INSERT ON TABLE "$MYSQL_DB_NAME".servers TO "$MYSQL_DB_ADMIN_USER"@"$MYSQL_DB_HOST";

# activate changes
FLUSH PRIVILEGES;
