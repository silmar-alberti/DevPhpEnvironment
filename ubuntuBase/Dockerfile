FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade

#install php packages
RUN apt-get -y install --no-install-recommends apt-utils apache2 \
            php \
            php-imagick \
            php-mysql \
            php-apcu \
            php-curl \
            php-imap \
            php-gd \
            php-zip \
            php-bcmath \
            php-xml \
            php-xdebug \
            libapache2-mod-php

##install tools
RUN apt-get -y install --no-install-recommends apt-utils vim \
            openssh-server \
            git \
            fail2ban \
            iputils-ping

##install node
#RUN apt-get install -y curl && \
#    curl -sL https://deb.nodesource.com/setup_8.x && \
#    apt-get -y update && \
#    apt-get -y upgrade && \
#    apt-get install -y nodejs \
#            build-essential


RUN apt-get -y install wget
RUN apt-get -y install composer

