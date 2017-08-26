FROM ubuntu:16.04

RUN useradd -ms /bin/bash sshUser
RUN echo 'sshUser:pass' | chpasswd
RUN echo Port 22 >> /etc/ssh/ssh_config



RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends apt-utils apache2 \
            php \
            php-imagick \
            php-mysql \
            php-apcu \
            php-curl \
            php-imap \
            php-gd \
            php-mbstring \
            vim \
            openssh-server \
            libapache2-mod-php \
            php-xml \
            git \
            php-zip \
            php-bcmath \
            fail2ban \
            php-xdebug \
            php7.0-dev \
            dnsmasq && \
            apt-get install -y curl && \
            curl -sL https://deb.nodesource.com/setup_8.x | bash && \
            apt-get update && \
            apt-get -y upgrade && \
            apt-get install -y nodejs \
            build-essential

RUN apt-get -y install wget
RUN apt-get -y install composer

