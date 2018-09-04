FROM php:5.4-apache

RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev \
    libssl-dev \
    libsasl2-dev && \
    docker-php-ext-install pdo_mysql zip && \
    rm -r /var/lib/apt/lists/*

## Install MongoDB Driver
#RUN curl -L https://github.com/mongodb/mongo-php-driver-legacy/archive/1.6.12.tar.gz >> /usr/src/php/ext/mongo.tar.gz && \
#tar -xf /usr/src/php/ext/mongo.tar.gz -C /usr/src/php/ext/ && \
#rm /usr/src/php/ext/mongo.tar.gz && \
#docker-php-ext-install mongo-php-driver-legacy-1.6.12


COPY apache2.conf /etc/apache2/apache2.conf
COPY php.ini /usr/local/etc/php/
