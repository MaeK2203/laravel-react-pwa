FROM php:8.2-fpm as build

COPY php.ini-development /usr/local/etc/php/php.ini

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
     ca-certificates \
     curl \
     xz-utils \
     git \
     libgmp-dev \
     unzip \
     libzip-dev \
     lsb-release && \
    apt-get clean && \
    docker-php-ext-install pdo_mysql

# redis
RUN pecl install redis && docker-php-ext-enable redis

# php composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# php-fpm config
COPY ./php-fpm.d/zzz-www.conf /usr/local/etc/php-fpm.d/zzz-www.conf

WORKDIR /var/www/html

FROM build as development
RUN apt-get update && \
apt-get install -y --no-install-recommends \
    vim \
    procps \
    less

FROM build as staging
# It is assumed that the /server directory has been created in deploy-staging.yml.
COPY ./server /var/www/html
RUN chown -R www-data:www-data storage
RUN chown -R www-data:www-data bootstrap/cache
RUN ls -ltra
RUN composer install --optimize-autoloader
RUN php artisan key:generate

FROM build as production
# It is assumed that the /server directory has been created in deploy-production.yml
COPY ./server /var/www/html
RUN chown -R www-data:www-data storage
RUN chown -R www-data:www-data bootstrap/cache
RUN ls -ltra
RUN composer install --no-dev --optimize-autoloader
RUN php artisan key:generate
