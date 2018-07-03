FROM 617580300246.dkr.ecr.us-west-2.amazonaws.com/docassemble-base:latest
COPY . /tmp/docassemble/
RUN cp /tmp/docassemble/docassemble_webapp/docassemble.wsgi /usr/share/docassemble/webapp/
RUN cp /tmp/docassemble/Docker/*.sh /usr/share/docassemble/webapp/
RUN cp /tmp/docassemble/Docker/VERSION /usr/share/docassemble/webapp/
RUN cp /tmp/docassemble/Docker/pip.conf /usr/share/docassemble/local/
RUN cp /tmp/docassemble/Docker/config/* /usr/share/docassemble/config/
RUN cp /tmp/docassemble/Docker/cgi-bin/index.sh /usr/lib/cgi-bin/
RUN cp /tmp/docassemble/Docker/syslog-ng.conf /usr/share/docassemble/webapp/syslog-ng.conf
RUN cp /tmp/docassemble/Docker/syslog-ng-docker.conf /usr/share/docassemble/webapp/syslog-ng-docker.conf
RUN cp /tmp/docassemble/Docker/docassemble-syslog-ng.conf /usr/share/docassemble/webapp/docassemble-syslog-ng.conf
RUN cp /tmp/docassemble/Docker/apache.logrotate /etc/logrotate.d/apache2
RUN cp /tmp/docassemble/Docker/docassemble.logrotate /etc/logrotate.d/docassemble
RUN cp /tmp/docassemble/Docker/cron/docassemble-cron-monthly.sh /etc/cron.monthly/docassemble
RUN cp /tmp/docassemble/Docker/cron/docassemble-cron-weekly.sh /etc/cron.weekly/docassemble
RUN cp /tmp/docassemble/Docker/cron/docassemble-cron-daily.sh /etc/cron.daily/docassemble
RUN cp /tmp/docassemble/Docker/cron/docassemble-cron-hourly.sh /etc/cron.hourly/docassemble
RUN cp /tmp/docassemble/Docker/docassemble.conf /etc/apache2/conf-available/
RUN cp /tmp/docassemble/Docker/docassemble-behindlb.conf /etc/apache2/conf-available/
RUN cp /tmp/docassemble/Docker/docassemble-supervisor.conf /etc/supervisor/conf.d/docassemble.conf
RUN cp /tmp/docassemble/Docker/ssl/* /usr/share/docassemble/certs/
RUN cp /tmp/docassemble/Docker/rabbitmq.config /etc/rabbitmq/
RUN cp /tmp/docassemble/Docker/config/exim4-router /etc/exim4/conf.d/router/101_docassemble
RUN cp /tmp/docassemble/Docker/config/exim4-filter /etc/exim4/docassemble-filter
RUN cp /tmp/docassemble/Docker/config/exim4-main /etc/exim4/conf.d/main/01_docassemble
RUN cp /tmp/docassemble/Docker/config/exim4-acl /etc/exim4/conf.d/acl/29_docassemble
RUN cp /tmp/docassemble/Docker/config/exim4-update /etc/exim4/update-exim4.conf.conf
RUN update-exim4.conf
RUN chown www-data.www-data /usr/share/docassemble/config
RUN chown www-data.www-data /usr/share/docassemble/config/config.yml.dist /usr/share/docassemble/webapp/docassemble.wsgi
RUN chown -R www-data.www-data /tmp/docassemble /usr/share/docassemble/local /usr/share/docassemble/log /usr/share/docassemble/files
RUN chmod ogu+r /usr/share/docassemble/config/config.yml.dist
RUN chmod 755 /etc/ssl/docassemble
USER www-data
RUN cd /tmp && virtualenv /usr/share/docassemble/local && source /usr/share/docassemble/local/bin/activate && pip install /tmp/docassemble/docassemble /tmp/docassemble/docassemble_base /tmp/docassemble/docassemble_demo /tmp/docassemble/docassemble_webapp
USER root
RUN rm -rf /tmp/docassemble
RUN sed -i -e 's/^\(daemonize\s*\)yes\s*$/\1no/g' -e 's/^bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
RUN sed -i -e 's/#APACHE_ULIMIT_MAX_FILES/APACHE_ULIMIT_MAX_FILES/' -e 's/ulimit -n 65536/ulimit -n 8192/' /etc/apache2/envvars
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen && update-locale LANG=en_US.UTF-8
RUN a2dismod ssl; a2enmod wsgi; a2enmod rewrite; a2enmod xsendfile; a2enmod proxy; a2enmod proxy_http; a2enmod proxy_wstunnel; a2enmod headers; a2enconf docassemble
EXPOSE 80 443 9001 514 25 465 8080 8081 5432 6379 4369 5671 5672 25672
ENV CONTAINERROLE="all" LOCALE="en_US.UTF-8 UTF-8" TIMEZONE="America/New_York" EC2="" S3ENABLE="" S3BUCKET="" S3ACCESSKEY="" S3SECRETACCESSKEY="" DAHOSTNAME="" USEHTTPS="" USELETSENCRYPT="" LETSENCRYPTEMAIL="" DBHOST="" LOGSERVER="" REDIS="" RABBITMQ=""
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
