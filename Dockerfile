FROM ubuntubase_ubuntu_base:latest

COPY auryn/ /auryn/

RUN /bin/bash /auryn/util/updatePhpunit.sh
RUN /bin/bash /auryn/config/apacheConfig.sh
RUN /bin/bash /auryn/config/xdebugConfig.sh

RUN chmod 777 -R /auryn/config/apacheAppsConfig.sh

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2

CMD chmod 777 -R /var/www \
	&& /auryn/config/apacheAppsConfig.sh \
    	&& service ssh start \
    	&& chmod 777 -R /var/www \
	#precisa sempre ser o ultimo comando
	&& /bin/bash /auryn/util/apache2-foreground.sh

