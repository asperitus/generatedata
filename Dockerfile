FROM php:7.3-apache

#
ARG generatedata_version=3.2.8

LABEL Description="This image starts generatedata" Vendor="computerlyrik" Version="${generatedata_version}"

RUN docker-php-ext-install mysqli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD https://github.com/benkeen/generatedata/archive/${generatedata_version}.tar.gz /generatedata.tar.gz
RUN tar xzf /generatedata.tar.gz -C /var/www/html/
RUN ln -s /var/www/html/generatedata-${generatedata_version} generatedata
RUN chown -R www-data /var/www/html 

RUN a2enmod rewrite

WORKDIR /var/www/html/generatedata

RUN composer install

# ONBUILD COPY settings.php /var/www/html/generatedata/settings.php
COPY settings.php /var/www/html/generatedata/settings.php

# https://github.com/geniousinteractive/docker-apache-php/blob/master/7.3/Dockerfile
# zip support is missing
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --fix-missing \
    apt-utils \
    gnupg

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN curl -sS --insecure https://www.dotdeb.org/dotdeb.gpg | apt-key add -

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev
RUN docker-php-ext-install zip
##
