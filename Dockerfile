FROM debian:stable
ENV DEBIAN_FRONTEND="noninteractive" CONTAINERROLE="all" LOCALE="en_US.UTF-8 UTF-8" TIMEZONE="America/New_York" EC2="" S3ENABLE="" S3BUCKET="" S3ACCESSKEY="" S3SECRETACCESSKEY="" DAHOSTNAME="" USEHTTPS="" USELETSENCRYPT="" LETSENCRYPTEMAIL="" DBHOST="" LOGSERVER="" REDIS="" RABBITMQ=""
USER root
RUN sed -i 's/101/0/g' /usr/sbin/policy-rc.d
RUN apt-get -q -y update
RUN apt-get -q -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get -q -y upgrade
RUN apt-get -q -y install apt-utils tzdata python python-dev python-setuptools wget unzip git locales pandoc texlive texlive-latex-extra texlive-font-utils texlive-extra-utils apache2 postgresql libapache2-mod-wsgi libapache2-mod-xsendfile poppler-utils libffi-dev libffi6 imagemagick gcc supervisor libaudio-flac-header-perl libaudio-musepack-perl libmp3-tag-perl libogg-vorbis-header-pureperl-perl make perl libvorbis-dev libcddb-perl libinline-perl libcddb-get-perl libmp3-tag-perl libaudio-scan-perl libaudio-flac-header-perl libparallel-forkmanager-perl libav-tools autoconf automake libjpeg-dev zlib1g-dev libpq-dev logrotate cron pdftk libxml2 libxslt1.1 libxml2-dev libxslt1-dev libcurl4-openssl-dev libssl-dev redis-server rabbitmq-server libreoffice libtool libtool-bin pacpl syslog-ng rsync s3cmd mktemp dnsutils tesseract-ocr tesseract-ocr-dev tesseract-ocr-afr tesseract-ocr-ara tesseract-ocr-aze tesseract-ocr-bel tesseract-ocr-ben tesseract-ocr-bul tesseract-ocr-cat tesseract-ocr-ces tesseract-ocr-chi-sim tesseract-ocr-chi-tra tesseract-ocr-chr tesseract-ocr-dan tesseract-ocr-deu tesseract-ocr-deu-frak tesseract-ocr-ell tesseract-ocr-eng tesseract-ocr-enm tesseract-ocr-epo tesseract-ocr-equ tesseract-ocr-est tesseract-ocr-eus tesseract-ocr-fin tesseract-ocr-fra tesseract-ocr-frk tesseract-ocr-frm tesseract-ocr-glg tesseract-ocr-grc tesseract-ocr-heb tesseract-ocr-hin tesseract-ocr-hrv tesseract-ocr-hun tesseract-ocr-ind tesseract-ocr-isl tesseract-ocr-ita tesseract-ocr-ita-old tesseract-ocr-jpn tesseract-ocr-kan tesseract-ocr-kor tesseract-ocr-lav tesseract-ocr-lit tesseract-ocr-mal tesseract-ocr-mkd tesseract-ocr-mlt tesseract-ocr-msa tesseract-ocr-nld tesseract-ocr-nor tesseract-ocr-osd tesseract-ocr-pol tesseract-ocr-por tesseract-ocr-ron tesseract-ocr-rus tesseract-ocr-slk tesseract-ocr-slk-frak tesseract-ocr-slv tesseract-ocr-spa tesseract-ocr-spa-old tesseract-ocr-sqi tesseract-ocr-srp tesseract-ocr-swa tesseract-ocr-swe tesseract-ocr-tam tesseract-ocr-tel tesseract-ocr-tgl tesseract-ocr-tha tesseract-ocr-tur tesseract-ocr-ukr tesseract-ocr-vie build-essential nodejs exim4-daemon-heavy libsvm3 libsvm-dev liblinear3 liblinear-dev libzbar-dev cm-super libgs-dev ghostscript default-libmysqlclient-dev libgmp-dev python-passlib libsasl2-dev libldap2-dev fonts-ebgaramond-extra ttf-liberation fonts-liberation
RUN apt -y autoremove
RUN mkdir -p /etc/ssl/docassemble /usr/share/docassemble/local /usr/share/docassemble/certs /usr/share/docassemble/backup /usr/share/docassemble/config /usr/share/docassemble/webapp /usr/share/docassemble/files /var/www/.pip /var/www/.cache /usr/share/docassemble/log /tmp/docassemble /var/www/html/log
RUN chown -R www-data.www-data /var/www
RUN chsh -s /bin/bash www-data
RUN npm install -g azure-storage-cmd
RUN git clone https://github.com/letsencrypt/letsencrypt /usr/share/docassemble/letsencrypt
RUN echo "host   all   all  0.0.0.0/0   md5" >> /etc/postgresql/9.6/main/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.6/main/postgresql.conf
RUN easy_install pip
RUN pip install --upgrade virtualenv pip 3to2 pdfx
COPY . /tmp/docassemble/
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
RUN cd /tmp && virtualenv /usr/share/docassemble/local && . /usr/share/docassemble/local/bin/activate && pip install ndg-httpsclient 'git+https://github.com/nekstrom/pyrtf-ng#egg=pyrtf-ng' docassemble docassemble.base docassemble.demo docassemble.webapp docassemble.helloworld
USER root
RUN rm -rf /tmp/docassemble
RUN sed -i -e 's/^\(daemonize\s*\)yes\s*$/\1no/g' -e 's/^bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf
RUN sed -i -e 's/#APACHE_ULIMIT_MAX_FILES/APACHE_ULIMIT_MAX_FILES/' -e 's/ulimit -n 65536/ulimit -n 8192/' /etc/apache2/envvars
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
RUN update-locale LANG=en_US.UTF-8
RUN a2dismod ssl
RUN a2enmod wsgi
RUN a2enmod rewrite
RUN a2enmod xsendfile
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod headers
RUN a2enconf docassemble
RUN service apache2 restart
EXPOSE 80 443 9001 514 25 465 8080 8081 5432 6379 4369 5671 5672 25672
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
