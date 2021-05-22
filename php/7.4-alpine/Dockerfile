FROM php:7.4-fpm-alpine

RUN \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    gettext-dev \
    icu-dev \
    libxml2-dev \
    tidyhtml-dev \
    libxslt-dev && \
    #install core ext
    docker-php-ext-install -j$(nproc) \
    bcmath \
    calendar \
    pcntl \
    pdo_mysql \
    gettext \  
    sockets \
    intl \
    mysqli  \
    shmop  \
    sysvsem \
    opcache && \
    #install composer
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');" && \
    # install redis,yaconf
    pecl install redis yaconf && \
    docker-php-ext-enable redis yaconf && \
    # install sozp
    docker-php-ext-install -j$(nproc) soap  xmlrpc tidy xsl && \
    apk del .build-deps

#install gd,zip
RUN \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    # for GD
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev  \
    libzip-dev && \
    #install gd
    docker-php-ext-configure gd  --with-webp --with-jpeg \
    --with-xpm --with-freetype && \
    docker-php-ext-install -j$(nproc) gd && \
    #install zip
    #docker-php-ext-configure zip --with-libzip && \
	docker-php-ext-install zip && \
    docker-php-ext-enable zip && \
    apk del .build-deps



#install swoole
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS git  && \
    cd /tmp && \
	git clone https://github.com/swoole/swoole-src.git && \
    cd swoole-src && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/swoole-src && \
    docker-php-ext-enable swoole && \
    apk del .build-deps


RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS libssh2-dev && \
    #apk add --no-cache --virtual .runtime-deps libssh2 && \
    pecl install ssh2-1.2 && \
    docker-php-ext-enable ssh2 && \
    apk del .build-deps

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS  libmcrypt-dev && \
    #apk add --no-cache --virtual .runtime-deps libmcrypt && \
    pecl install mcrypt && \
    docker-php-ext-enable mcrypt && \
    apk del .build-deps


RUN apk add --no-cache --virtual .runtime-deps \
    #for 
    gettext \
    #icu \
    # for GD
    freetype \
    libpng \
    libjpeg-turbo \
    libwebp \
    libxpm \
    libzip \
    libxml2 \
    #tidyhtml \
    libxslt \
    zip \
    libssh2 \
    libmcrypt \
    #new
    libintl \
    icu-libs \
    libstdc++ \
    tidyhtml-libs && \
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"  && \
    rm -rf /var/cache/apk/*



# Use the default production configuration
#RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"  && \
#    rm -rf /var/cache/apk/*






