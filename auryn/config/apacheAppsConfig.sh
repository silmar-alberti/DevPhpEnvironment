#!/usr/bin/env bash

SYSTEMS_ENABLEDS=/etc/apache2/sites-enabled/*
SYSTEMS_AVAILABLES=/etc/apache2/sites-available/*
CONFIG_FILES=/var/www/*/dockerConfig/*.apache.conf
INIT_FILES=/var/www/*/dockerConfig/init.sh

for config_file in $SYSTEMS_ENABLEDS
do
    systemname="${config_file##*/}"
    echo "desativando " $systemname
    a2dissite $systemname

done

#remove sites-available
rm /etc/apache2/sites-available/*

#adiciona arquivos de configuracao
for config_file in $CONFIG_FILES
do
    echo "configurando site:"$config_file
    cp $config_file /etc/apache2/sites-available/
done

chmod 777 $SYSTEMS_AVAILABLES

for config_file in $CONFIG_FILES
do
    systemname="${config_file##*/}"
    a2ensite $systemname
done

for init_file in $INIT_FILES
do
    echo "executanto: "$init_file
    chmod +x $init_file
    /bin/bash $init_file
done