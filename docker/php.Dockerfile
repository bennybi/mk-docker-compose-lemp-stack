FROM php:7.3-fpm

RUN apt-get update && \
    apt-get install -y git zip libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev

RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ && \
    docker-php-ext-install mysqli -j$(nproc) gd

COPY ./php.ini /usr/local/etc/php/php.ini
