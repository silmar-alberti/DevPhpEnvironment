#!/usr/bin/env bash

# https://docs.docker.com/engine/tutorials/dockervolumes/#mount-a-shared-storage-volume-as-a-data-volume
#comando compartilha a pasta com o container

LOCALWWW=/var/www2

docker run -i -t -v $LOCALWWW:/var/www devphpenvironment_php