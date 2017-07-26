FROM ubuntu:16.04

COPY auryn/ /auryn/

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
            php-bcmath \
            fail2ban \
            php-xdebug \
            iputils-ping

RUN apt-get -y install wget
RUN apt-get -y install composer

RUN /bin/bash /auryn/util/updatePhpunit.sh
RUN /bin/bash /auryn/config/apacheConfig.sh
RUN /bin/bash /auryn/config/xdebugConfig.sh


CMD /bin/bash /auryn/config/apacheAppsConfig.sh \
    && chmod 777 -R /var/www \
    && service apache2 restart \
    && sleep infinity
