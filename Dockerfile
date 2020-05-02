FROM debian:stable
MAINTAINER me+docker@seth0r.net

ENV MYSQL_DB_HOST   mariadb
ENV MYSQL_DB_NAME   log
ENV MYSQL_DB_LOGGER_USER    logger
ENV MYSQL_DB_LOGGER_PASS    loggerpass
ENV MYSQL_DB_ADMIN_USER     loggeradmin
ENV MYSQL_DB_ADMIN_PASS     adminpass
ENV MYSQL_DB_VIEW_USER      logviewer
ENV MYSQL_DB_VIEW_PASS      viewerpass
ENV TIMEZONE    Europe/Berlin

RUN apt-get update 
RUN apt-get dist-upgrade -y
RUN apt-get -y install git wget gettext supervisor cron apache2 php7.3 php7.3-mysql syslog-ng libdbd-mysql

RUN a2enmod headers expires
RUN sed 's!^;date.timezone =$!date.timezone = \$TIMEZONE!' /etc/php/7.3/apache2/php.ini > /etc/php/7.3/apache2/php.ini.prep
RUN sed 's!^;date.timezone =$!date.timezone = \$TIMEZONE!' /etc/php/7.3/cli/php.ini > /etc/php/7.3/cli/php.ini.prep

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log
RUN rm /etc/apache2/sites-enabled/000-default.conf
COPY apache.conf /etc/apache2/sites-enabled/000-logger.conf

RUN git clone https://git.kretschmann.software/kai/lggr.git /var/www/logger
RUN wget -qO- https://lggr.io/wp-content/uploads/2015/06/lggr_contrib.tar.gz | tar -xvz -C /var/www/logger

COPY inc/*.php /var/www/logger/inc/
COPY user.sql /var/www/logger/doc/user.sql
RUN sed -i "s/'localhost'/getenv(\"MYSQL_DB_HOST\")/" /var/www/logger/inc/lggr_class.php

COPY 08logger.conf /etc/syslog-ng/conf.d/08logger.conf.prep
RUN sed -i 's!^#SYSLOGNG_OPTS!SYSLOGNG_OPTS!' /etc/default/syslog-ng

COPY *.sh /usr/local/sbin/
RUN chmod 0755 /usr/local/sbin/*.sh

#RUN apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy hello-cron file to the cron.d directory
#COPY lggr-cron /etc/cron.d/lggr-cron

# Give execution rights on the cron job
#RUN chmod 0644 /etc/cron.d/lggr-cron

# Apply cron job
#RUN crontab /etc/cron.d/lggr-cron

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/local/sbin/run.sh"]
