#!/usr/bin/env bash

# Добавление репозитория
function add_repository() {
    apt-get update
    apt -y install software-properties-common
    add-apt-repository ppa:ondrej/php -y
    apt-get update
}

# Установка php
function install_php_with_apache_7_0() {
    # В процессе установки нужно задать временную зону
    apt install \
    php7.0 \
    libapache2-mod-php7.0 \
    php7.0-mysql \
    php7.0-curl \
    php7.0-mbstring \
    php7.0-intl \
    php7.0-soap \
    php7.0-xml -y
    service apache2 restart
}

function remove_php_7_0() {
    apt-get purge php7.0* -y
    a2dismod php7.0
    service apache2 restart
}

function install_php_with_apache_7_1() {
    # В процессе установки нужно задать временную зону
    apt install \
    php7.1 \
    libapache2-mod-php7.1 \
    php7.1-mysql \
    php7.1-curl \
    php7.1-mbstring \
    php7.1-intl \
    php7.1-soap \
    php7.1-xml -y
    service apache2 restart
}

function remove_php_7_1() {
    apt-get purge php7.1* -y
    a2dismod php7.1
    service apache2 restart
}

function install_php_with_apache_7_2() {
    # В процессе установки нужно задать временную зону
    apt install \
    php7.2 \
    libapache2-mod-php7.2 \
    php7.2-mysql \
    php7.2-curl \
    php7.2-mbstring \
    php7.2-intl \
    php7.2-soap \
    php7.2-xml -y
    service apache2 restart
}

function remove_php_7_2() {
    apt-get purge php7.2* -y
    a2dismod php7.2
    service apache2 restart
}

function install_php_with_apache_7_3() {
    # В процессе установки нужно задать временную зону
    apt install \
    php7.3 \
    libapache2-mod-php7.3 \
    php7.3-mysql \
    php7.3-curl \
    php7.3-mbstring \
    php7.3-intl \
    php7.3-soap \
    php7.3-xml -y
    service apache2 restart
}

function remove_php_7_3() {
    apt-get purge php7.3* -y
    a2dismod php7.3
    service apache2 restart
}

function install_php_with_apache_7_4() {
    # В процессе установки нужно задать временную зону
    apt install \
    php7.4 \
    libapache2-mod-php7.4 \
    php7.4-mysql \
    php7.4-curl \
    php7.4-mbstring \
    php7.4-intl \
    php7.4-soap \
    php7.4-xml -y
    service apache2 restart
}

function remove_php_7_4() {
    apt-get purge php7.4* -y
    a2dismod php7.4
    service apache2 restart
}