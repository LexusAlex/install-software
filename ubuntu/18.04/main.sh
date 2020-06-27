#!/usr/bin/env bash

DIR=$(dirname "$(readlink -e "$0")")

source ${DIR}/system.sh
source ${DIR}/apache.sh
source ${DIR}/nginx.sh
source ${DIR}/php.sh
source ${DIR}/vsftpd.sh

#apt-install

# apache
#install-snd-apache
#access-right
#add-new-virtual-host
#start-virtual-host

# nginx
#install-snd-nginx

#php
#add_repository
#install_php_with_apache_7_4
#delete-snd-nginx

#ftp
#install-vsftpd
#replace_config

#delete
#remove_php_7_4
#remove-snd-apache
