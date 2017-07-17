#!/usr/bin/env bash

phpIniApache=/etc/php/7.0/apache2/php.ini
phpIniCli=/etc/php/7.0/cli/php.ini
sshdConfig=/etc/ssh/sshd_config

sed -i "s/.*realpath_cache_size.*=.*/realpath_cache_size = 4096k/" $phpIniApache
sed -i "s/.*memory_limit.*=.*/memory_limit = 512M/" $phpIniApache
sed -i "s/.*post_max_size.*=.*/post_max_size = 200M/" $phpIniApache
sed -i "s/.*upload_max_filesize.*=.*/upload_max_filesize = 200M/" $phpIniApache
sed -i "s/.*date.timezone.*=.*/date.timezone = America\/Sao_Paulo/" $phpIniApache

sed -i "s/.*realpath_cache_size.*=.*/realpath_cache_size = 4096k/" $phpIniCli
sed -i "s/.*memory_limit.*=.*/memory_limit = 512M/" $phpIniCli
sed -i "s/.*post_max_size.*=.*/post_max_size = 200M/" $phpIniCli
sed -i "s/.*upload_max_filesize.*=.*/upload_max_filesize = 200M/" $phpIniCli
sed -i "s/.*date.timezone.*=.*/date.timezone = America\/Sao_Paulo/" $phpIniCli

sed -i "s/^PermitRootLogin.*/PermitRootLogin no/" $sshdConfig
sed -i "s/^PasswordAuthentication.*/PasswordAuthentication no/" $sshdConfig

timedatectl set-timezone America/Sao_Paulo

a2enmod rewrite
a2enmod headers
a2enmod ssl
phpenmod imap

get_config_has_APC () {
        echo $( grep "extension.*apc.*so" $1 | wc -l )
}

if [ ! -f "/etc/php/7.0/mods-available/apcu.ini" ]; then

	if [ ! -d "apcu-bc" ]; then
		git clone https://github.com/krakjoe/apcu-bc.git
	fi

	cd apcu-bc
	apt install php7.0-dev
	phpize
	./configure
	make
	make install
else
	echo "APCU estava instalado..."
fi

apcText='\nextension=apcu.so\nextension=apc.so\n'
apcIniApache=$( get_config_has_APC $phpIniApache )
apcIniCli=$( get_config_has_APC $phpIniCli )

if [ $apcIniApache -eq 0 ]; then
	echo "Adicionando ACPU no arquivo $phpIniApache"
	printf $apcText >> $phpIniApache
fi
if [ $apcIniCli -eq 0 ]; then
	echo "Adicionando ACPU no arquivo $phpIniCli"
	printf $apcText >> $phpIniCli
fi