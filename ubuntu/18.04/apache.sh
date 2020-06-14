#!/usr/bin/env bash

# Установка apache2 стандартной комплектации
function install-snd-apache() {
    I=`apt-cache policy apache2 | grep "Installed: (none)"`
    [[ "$I" != "" ]] && echo "Установка apache2" && apt install apache2 -y
    service apache2 start
}

# Удаление apache2
function remove-snd-apache() {
    apt remove --purge apache2 apache2-utils apache2-bin apache2-data -y
    # dpkg -l | grep apache
}

# Прикрываем стандарный localhost
function disabled-localhost() {
    a2dissite 000-default.conf
    service apache2 reload
}