FROM wordpress:5.8-php7.4-apache

# Install mhsendmail to forward emails to Mailhog
RUN curl -sL https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 --output mhsendmail && \
    chmod +x mhsendmail && mv mhsendmail /usr/local/bin/


ARG workdir=/var/www/html
ARG duplicator_package=$workdir/duplicator_package

COPY ./php_conf/* $PHP_INI_DIR/conf.d/

RUN mkdir $duplicator_package

COPY ./duplicator_package/* $duplicator_package/

COPY check-wp-package.sh /usr/local/bin/

ENTRYPOINT ["check-wp-package.sh"]

CMD ["apache2-foreground"]
