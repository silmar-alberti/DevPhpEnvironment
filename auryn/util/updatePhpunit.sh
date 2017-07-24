
phpunit="phpunit"
if [ -n "$1" ]; then
    phpunit="phpunit-$1"
fi

cd /tmp/
wget http://phar.phpunit.de/"$phpunit".phar
chmod +x "$phpunit".phar
mv "$phpunit".phar /usr/local/bin/phpunit
phpunit --version
