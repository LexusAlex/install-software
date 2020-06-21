#!/usr/bin/env bash

function install-snd-nginx() {
    I=`apt-cache policy nginx | grep "Installed: (none)"`
    [[ "$I" != "" ]] && echo "Установка nginx" && apt install nginx -y
    service nginx start
}

function delete-snd-nginx() {
    apt remove nginx -y
    apt purge nginx -y
    apt autoremove -y
}