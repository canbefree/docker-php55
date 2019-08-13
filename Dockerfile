FROM php:5.5-fpm

LABEL maintainer xieyutian "xieyutianhn@gmail.com"

RUN apt-get update

RUN apt-get install git libpng-dev libfreetype6-dev -y


RUN curl -O https://getcomposer.org/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/bin/composer \
    && composer config -g repo.packagist composer https://packagist.laravel-china.org 

RUN git clone https://github.com/xdebug/xdebug \
    && cd xdebug \
    && git checkout xdebug_2_5 \
    && ./rebuild.sh \
    && docker-php-ext-enable xdebug \
    && cd ..\
    && rm -rf xdebug

RUN docker-php-ext-install mysql bcmath pdo_mysql zip 

RUN docker-php-ext-configure gd --with-freetype-dir \
    && docker-php-ext-install gd

# 以root运行并强制前端运行
CMD php-fpm -RF