#!/usr/bin/env bash
export IP_HOST=$(LANG=C ifconfig docker0 | awk -F: '/inet addr/ {gsub(/ .*/,"",$2); print $2}')

cd ubuntuBase
docker-compose build

cd ../
docker-compose build
docker-compose create