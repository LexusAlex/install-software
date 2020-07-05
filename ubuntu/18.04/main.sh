#!/usr/bin/env bash

DIR=$(dirname "$(readlink -e "$0")")

source ${DIR}/system.sh
source ${DIR}/apache.sh
source ${DIR}/nginx.sh
source ${DIR}/php.sh
source ${DIR}/mariadb.sh
source ${DIR}/vsftpd.sh

apt-install

# apache
install-snd-apache
access-right developer
#add-new-virtual-host-mod-php tested.loc
#start-virtual-host tested.loc developer

# Создание виртуальных хостов

#add-new-virtual-host-php-fpm php-fpm.5.6.loc 5.6
#start-virtual-host php-fpm.5.6.loc developer
#create_test_file php-fpm.5.6.loc developer

#install-snd-nginx


# Установки разных версий php

#install_php_with_apache_fpm 7.4

# nginx
#install-snd-nginx

#php
#add_repository
#install_php_with_apache_fpm_7_1
#install_php_with_apache_7_0
#delete-snd-nginx

#enabled_fpm_modules

#ftp
#install-vsftpd
#replace_config

#delete
#remove_php_7_4
#remove-snd-apache
