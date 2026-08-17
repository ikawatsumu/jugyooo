FROM php:8.4-fpm-alpine

# GDのインストール（今あったものをそのまま残しています）
RUN apk add --no-cache freetype-dev libjpeg-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# データベース(MySQL)に接続するための拡張モジュール
RUN docker-php-ext-install pdo_mysql

# 画像アップロード用のディレクトリを作成し、権限を付与（第11回の内容）
RUN install -o www-data -g www-data -d /var/www/upload/image/
