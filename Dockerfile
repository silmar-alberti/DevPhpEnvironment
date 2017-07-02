FROM ubuntu:16.04

COPY *Config.sh /auryn/config/

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
            php-xdebug

RUN /bin/bash /auryn/config/apacheConfig.sh
RUN /bin/bash /auryn/config/xdebugConfig.sh

RUN apt-get -y install composer phpunit

CMD /bin/bash /auryn/config/apacheAppsConfig.sh \
    && service apache2 restart \
    && chmod 777 -R /var/www \
    && /bin/bash \
    && sleep infinity