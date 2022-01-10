FROM php:7.2.4-apache-stretch

MAINTAINER Dramelac

RUN docker-php-ext-install mysqli

COPY ./website /var/www/website/.
COPY ./shadow /var/www/shadow/.
COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf
RUN echo "Listen 8080" >> /etc/apache2/ports.conf

RUN chown -R www-data:www-data /var/www/website && chmod -R 400 /var/www/website && find /var/www/website -type d -exec chmod 0550 {} \;
