FROM php:5.6.5-fpm

RUN php -r "readfile('http://symfony.com/installer');" > symfony.phar && \
  mv symfony.phar /usr/local/bin/symfony && \
  chmod a+x /usr/local/bin/symfony

ENTRYPOINT ["symfony"]
