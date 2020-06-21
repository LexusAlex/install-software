#!/usr/bin/env bash

# Установка ftp сервера
function install-vsftpd() {
    apt install vsftpd -y
    cp /etc/vsftpd.conf /etc/vsftpd.conf.default
    service vsftpd start
}

# Замена конфигурационного файла
function replace_config() {
    cp /root/install-software/ubuntu/18.04/configs/vsftpd/vsftpd.conf /etc/vsftpd.conf
    service vsftpd restart
}