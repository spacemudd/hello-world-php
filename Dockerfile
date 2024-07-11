#!/usr/bin/env bash
# --platform=linux/amd64 is necessary because if the Docker image was built on a Mac M chip, it would create errors
# when deployed on the prod cluster.
FROM --platform=linux/amd64 trafex/php-nginx:latest

COPY --chown=nobody . /var/www/html
RUN mkdir -p /var/run/php && \
    chown -R nobody.nobody /var/run/php

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-progress

EXPOSE 8900

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:9000/fpm-ping
