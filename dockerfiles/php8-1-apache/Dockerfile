FROM php:8.1-apache
ENV COMPOSER_ALLOW_SUPERUSER=1
WORKDIR /var/www/html
EXPOSE 80

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    nano wget build-essential git curl libcurl4 libcurl4-openssl-dev zip unzip iputils-ping \
    libzip-dev libonig-dev libicu-dev libmcrypt-dev libpng-dev \
    libsqlite3-dev libsqlite3-0 \
    gnupg zlib1g-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs npm
RUN npm install -g yarn
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install -j$(nproc) opcache pdo_mysql pdo_sqlite mbstring zip sockets curl mbstring
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure gd
RUN docker-php-ext-install -j$(nproc) gd

RUN a2enmod rewrite remoteip headers ssl
