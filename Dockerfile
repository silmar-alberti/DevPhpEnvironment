FROM ubuntu:16.04

COPY apacheConfig.sh /auryn/config/apacheConfig.sh

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install --no-install-recommends apt-utils apache2 \
            php \
            php-imagick \
            php-mysql \
            php-apcu \
            php-curl \
            php-imap \
            php-gd \
            vim \
            openssh-server \
            libapache2-mod-php \
            php-xml \
            git \
            php-zip \
#            phpmyadmin \
            php-bcmath \
            fail2ban

RUN /bin/bash /auryn/config/apacheConfig.sh


CMD service apache2 restart
#
#RUN yes | apt-get -y install xdebug \
#    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
#    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
#    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
#    && echo "xdebug.idekey=\"intellij\"" >> /usr/local/etc/php/conf.d/xdebug.ini \
#    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
#	&& echo "xdebug.max_nesting_level=200" >> /usr/local/etc/php/conf.d/xdebug.ini