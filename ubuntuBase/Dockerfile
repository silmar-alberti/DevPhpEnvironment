FROM ubuntu:16.04

RUN useradd -ms /bin/bash sshUser
RUN echo 'sshUser:pass' | chpasswd
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
            php-mbstring \
            vim \
            openssh-server \
            libapache2-mod-php \
            php-xml \
            git \
            php-zip \
            php-bcmath \
            fail2ban \
            php-xdebug

##install node
#RUN apt-get install -y curl && \
#    curl -sL https://deb.nodesource.com/setup_8.x && \
#    apt-get -y update && \
#    apt-get -y upgrade && \
#    apt-get install -y nodejs \
#            build-essential


RUN apt-get -y install wget
RUN apt-get -y install composer

