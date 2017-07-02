#!/usr/bin/env bash

SYSTEMS_ENABLEDS=/etc/apache2/sites-enabled/*
SYSTEMS_AVAILABLES=/etc/apache2/sites-available/*
CONFIG_FILES=/var/www/*/*.apache.conf

for config_file in $SYSTEMS_ENABLEDS
do
    systemname="${config_file##*/}"
    echo "desativando " $systemname
    a2dissite $systemname
#    echo $systemname
done

#remove sites-available
rm /etc/apache2/sites-available/*

#adiciona arquivos de configuracao
for config_file in $CONFIG_FILES
do
    echo "adicionando site"$config_file
    cp $config_file /etc/apache2/sites-available/
done

chmod 777 $SYSTEMS_AVAILABLES

for config_file in $CONFIG_FILES
do
    systemname="${config_file##*/}"
    a2ensite $systemname
done
