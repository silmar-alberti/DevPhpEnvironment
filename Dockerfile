FROM ubuntubase_ubuntu_base:latest
ARG REMOTE_HOST

COPY auryn/ /auryn/

RUN /bin/bash /auryn/util/updatePhpunit.sh && \
    /bin/bash /auryn/config/apacheConfig.sh && \
    /bin/bash /auryn/config/xdebugConfig.sh && \
    chmod 777 -R /auryn/config/apacheAppsConfig.sh

CMD chmod 777 -R /var/www \
	&& /auryn/config/apacheAppsConfig.sh \
    && service ssh start \
#    && service dnsmasq start \
    && chmod 777 -R /var/www \
	#precisa sempre ser o ultimo comando
	&& /bin/bash /auryn/util/apache2-foreground.sh

