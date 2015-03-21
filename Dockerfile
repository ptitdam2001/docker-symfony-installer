FROM php:5.6.5-cli

VOLUME ["/src"]
WORKDIR /src

RUN curl -LsS http://symfony.com/installer > symfony.phar && \
  mv symfony.phar /usr/local/bin/symfony && \
  chmod +x /usr/local/bin/symfony

ENTRYPOINT ["symfony"]
