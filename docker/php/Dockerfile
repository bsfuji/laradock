FROM php:7.4-fpm-alpine

WORKDIR /var/www/laravel/
RUN apk --no-cache update
RUN apk --no-cache upgrade
RUN apk --no-cache add libzip-dev libpng-dev libjpeg-turbo-dev mysql-client composer autoconf gcc g++ make
RUN apk --no-cache add zip jq fish oniguruma-dev
RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring gd opcache zip
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN { \
  echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/xdebug.so'; \
  echo 'xdebug.remote_enable=1'; \
  echo 'xdebug.remote_autostart=0'; \
  echo 'xdebug.remote_host=docker.for.mac.localhost'; \
  echo 'xdebug.remote_connect_back=0'; \
  echo 'xdebug.remote_port=9001'; \
  echo 'xdebug.remote_log=/tmp/xdebug.log'; \
  echo 'xdebug.max_nesting_level=512'; \
  echo 'xdebug.idekey=PHPSTORM'; \
} > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN { \
  echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20190902/opcache.so'; \
  echo 'opcache.enable=1'; \
  echo 'opcache.memory_consumption=256'; \
  echo 'opcache.interned_strings_buffer=8'; \
  echo 'opcache.max_accelerated_files=4000'; \
  echo 'opcache.revalidate_freq=2'; \
  echo 'opcache.fast_shutdown=1'; \
  echo 'opcache.enable_cli=1'; \
} > /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

RUN { \
  echo 'php_admin_value[upload_max_filesize] = 128M'; \
  echo 'php_value[short_open_tag] = Off'; \
} > /usr/local/etc/php-fpm.d/php.conf

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer