#!/bin/bash
if [ -n "$LGGR_USER" -a -n "$LGGR_PASS" ]; then
    htpasswd -b -c /var/www/webuser "$LGGR_USER" "$LGGR_PASS"
fi
envsubst < /etc/php/7.3/apache2/php.ini.prep > /etc/php/7.3/apache2/php.ini 
envsubst < /etc/php/7.3/cli/php.ini.prep > /etc/php/7.3/cli/php.ini 
envsubst < /etc/syslog-ng/conf.d/08logger.conf.prep | tr '%' '$' > /etc/syslog-ng/conf.d/08logger.conf
printenv | sed 's/^\(.*\)$/export "\1"/g' > /tmp/docker.env
exec supervisord
