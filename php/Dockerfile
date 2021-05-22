FROM php:7.3-fpm-alpine

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
    docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir \
    --with-xpm-dir --with-freetype-dir && \
    docker-php-ext-install -j$(nproc) gd && \
    #install zip
    docker-php-ext-configure zip --with-libzip && \
	docker-php-ext-install zip && \
    docker-php-ext-enable zip && \
    apk del .build-deps



#install swoole
ARG SWOOLE_VERSION=4.6.7

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS && \
    cd /tmp && \
	#git clone https://github.com/swoole/swoole-src.git && \
    curl -fsSL https://github.com/swoole/swoole-src/archive/refs/tags/v${SWOOLE_VERSION}.tar.gz -o swoole-src.tar.gz && \
    tar zxf swoole-src.tar.gz && \
    rm -rf swoole-src.tar.gz && \
    cd swoole-src-${SWOOLE_VERSION} && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/swoole-src-${SWOOLE_VERSION} && \
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

#install runtime deps
RUN apk add --no-cache --virtual .runtime-deps \
    #for 
    gettext \
    #icu \
    icu-libs \
    # for GD
    freetype \
    libpng \
    libjpeg-turbo \
    libwebp \
    libxpm \
    libzip \
    libxml2 \
    libintl \
    libstdc++ \
    tidyhtml-libs \
    #tidyhtml \
    libxslt \
    #zip
    #zip \
    #ssh2
    libssh2 \
    #mcrypt
    libmcrypt && \
    #copy ini
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"  && \
    rm -rf /var/cache/apk/*




# Use the default production configuration
#RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"  && \
#    rm -rf /var/cache/apk/*






