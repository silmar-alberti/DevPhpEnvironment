#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
  echo "Sudo! Onde estao os seus poderes de supervaca?! Mas não pode ser root!" 2>&1
  exit 1;
fi

clear_file_and_write() {
        rm ./.env
        echo 'IP_HOST='$IP_HOST >> ./.env
}

if [[ "$1" == --interface ]]; then
    IP_HOST=$(LANG=C ifconfig $2 | awk -F: '/inet addr/ {gsub(/ .*/,"",$2); print $2}');
    clear_file_and_write
elif [[ "$1" ==  --ip ]]; then
    IP_HOST=$2;
    clear_file_and_write
else
    echo 'usando arquivo de configuracao padrao'
fi


cd ubuntuBase
docker-compose build

cd ../
docker-compose build
docker-compose create

echo "----- execute docker-compose start    -------  para iniciar os containers"