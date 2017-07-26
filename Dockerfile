FROM ubuntubase_ubuntu_base

COPY auryn/ /auryn/

RUN /bin/bash /auryn/util/updatePhpunit.sh
RUN /bin/bash /auryn/config/apacheConfig.sh
RUN /bin/bash /auryn/config/xdebugConfig.sh

CMD /bin/bash /auryn/config/apacheAppsConfig.sh \
    && chmod 777 -R /var/www \
    && service apache2 restart \
    && sleep infinity
