FROM php:5.6.5-cli

VOLUME ["/src"]
WORKDIR /src

RUN curl -LsS http://symfony.com/installer > symfony.phar && \
  mv symfony.phar /usr/local/bin/symfony && \
  chmod +x /usr/local/bin/symfony

RUN echo 'if [ -z "$TIME_ZONE" ]; then echo "No TIME_ZONE env set!" && exit 1; fi' > /set_timezone.sh; \
	echo "sed -i 's|;date.timezone.*=.*|date.timezone='\$TIME_ZONE'|' $PHP_INI_DIR/php.ini;" >> /set_timezone.sh; \
	echo "echo \$TIME_ZONE > /etc/timezone;" >> /set_timezone.sh; \
	echo "export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive;" >> /set_timezone.sh; \
	echo "dpkg-reconfigure tzdata" >> /set_timezone.sh; \
	echo "echo time zone set to: \$TIME_ZONE"  >> /set_timezone.sh;

#RUN echo 'date.timezone="Europe/Paris";"' >> $PHP_INI_DIR/php.ini

ENTRYPOINT ["symfony"]
