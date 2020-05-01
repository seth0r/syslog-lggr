#!/bin/bash
if [ -n "$LGGR_USER" -a -n "$LGGR_PASSWORD" ]; then
    htpasswd -b -c /var/www/webuser "$LGGR_USER" "$LGGR_PASSWORD"
fi
envsubst < /etc/php/7.3/apache2/php.ini.prep > /etc/php/7.3/apache2/php.ini 
envsubst < /etc/php/7.3/cli/php.ini.prep > /etc/php/7.3/cli/php.ini 


exec supervisord
