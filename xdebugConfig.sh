#!/usr/bin/env bash

CLIPATH=/etc/php/7.0/cli/conf.d/xdebug.ini
REMOTE_HOST=172.17.0.1
#echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > $CLIPATH
echo "xdebug.remote_enable=on" >> $CLIPATH
#echo "xdebug.remote_autostart=off" >> $CLIPATH
echo "xdebug.remote_mode=req" >> $CLIPATH
echo "xdebug.idekey=\"netbeans-xdebug\"" >> $CLIPATH
echo "xdebug.remote_port=9000" >> $CLIPATH
echo "xdebug.max_nesting_level=200" >> $CLIPATH
echo "xdebug.remote_host="$REMOTE_HOST >> $CLIPATH

APACHEPATH=/etc/php/7.0/apache2/conf.d/xdebug.ini
#echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > $APACHEPATH
echo "xdebug.remote_enable=on" >> $APACHEPATH
echo "xdebug.remote_mode=req" >> $APACHEPATH
#echo "xdebug.remote_autostart=off" >> $APACHEPATH
echo "xdebug.idekey=\"netbeans-xdebug\"" >> $APACHEPATH
echo "xdebug.remote_port=9000" >> $APACHEPATH
echo "xdebug.max_nesting_level=200" >> $APACHEPATH
echo "xdebug.remote_host="$REMOTE_HOST >> $APACHEPATH