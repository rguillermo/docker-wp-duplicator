FROM wordpress:5.8-php7.4-apache

ARG workdir=/var/www/html
ARG duplicator_package=$workdir/duplicator_package

COPY ./php_conf/* $PHP_INI_DIR/conf.d/

RUN mkdir $duplicator_package

COPY ./duplicator_package/* $duplicator_package/

COPY check-wp-package.sh /usr/local/bin/

ENTRYPOINT ["check-wp-package.sh"]

CMD ["apache2-foreground"]
