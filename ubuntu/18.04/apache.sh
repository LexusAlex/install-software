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

# Права доступа на каталоги веб сервера
function access-right() {
    # Создание пользователя который будет работать с системой
    USER_NAME=$1
    cat /etc/passwd | grep ${USER_NAME} >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "Пользователь существует"
    else
        useradd ${USER_NAME} -m -s /bin/bash -d /var/www -g www-data
        echo "${USER_NAME}:test" | chpasswd
        echo "Пользователь создан"
    fi
    # Проставляем права
    find /var/www -type d -exec chown ${USER_NAME}:www-data {} \; -print
    find /var/www -type f -exec chown ${USER_NAME}:www-data {} \; -print
    find /var/www -type d -exec chmod 755 {} \; -print

}


# Новый виртуальный хост
function add-new-virtual-host-mod-php() {
    HOST_NAME=$1
    FILENAME=/etc/apache2/sites-available/${HOST_NAME}.conf

    if [ -f ${FILENAME} ] ; then
        echo "Фаил конфигурации ${FILENAME} существует"
    else
        touch ${FILENAME}
    fi

    if [ ! -f ${FILENAME} ] ; then
        echo "Не могу записать, файла ${FILENAME} не существует"
    else
        # Проверка на пустоту
        if [[ -s ${FILENAME} ]]; then
            echo "Фаил конфигурации ${FILENAME} уже записан";
        else
            { \
            echo '<VirtualHost *:80>'; \
            echo "ServerName ${HOST_NAME}"; \
            echo "ServerAdmin webmaster@localhost"; \
            echo "DocumentRoot /var/www/${HOST_NAME}/"; \
            echo "ErrorLog /var/log/apache2/error.${HOST_NAME}.log"; \
            echo "CustomLog /var/log/apache2/access.${HOST_NAME}.log combined"; \
            echo "<Directory /var/www/${HOST_NAME}/>"; \
            echo "Options -Includes -Indexes -ExecCGI"; \
            echo "AllowOverride All"; \
            echo "</Directory>"; \
            echo '</VirtualHost>'; \
        } | tee ${FILENAME}
        fi
    fi
}

# Новый виртуальный хост php-fpm
function add-new-virtual-host-php-fpm() {
    HOST_NAME=$1
    FILENAME=/etc/apache2/sites-available/${HOST_NAME}.conf
    VERSION=$2

    if [ -f ${FILENAME} ] ; then
        echo "Фаил конфигурации ${FILENAME} существует"
    else
        touch ${FILENAME}
    fi

    if [ ! -f ${FILENAME} ] ; then
        echo "Не могу записать, файла ${FILENAME} не существует"
    else
        # Проверка на пустоту
        if [[ -s ${FILENAME} ]]; then
            echo "Фаил конфигурации ${FILENAME} уже записан";
        else
            { \
            echo '<VirtualHost *:80>'; \
            echo "ServerName ${HOST_NAME}"; \
            echo "ServerAdmin webmaster@localhost"; \
            echo "DocumentRoot /var/www/${HOST_NAME}/"; \
            echo "ErrorLog /var/log/apache2/error.${HOST_NAME}.log"; \
            echo "CustomLog /var/log/apache2/access.${HOST_NAME}.log combined"; \
            echo "<Directory /var/www/${HOST_NAME}/>"; \
            echo "Options -Includes -Indexes -ExecCGI"; \
            echo "AllowOverride All"; \
            echo "</Directory>"; \
            echo "<FilesMatch \.php$>"; \
            echo "SetHandler 'proxy:unix:/run/php/php${VERSION}-fpm.sock|fcgi://localhost'"; \
            echo "</FilesMatch>"
            echo '</VirtualHost>'; \
        } | tee ${FILENAME}
        fi
    fi
}

# Создание каталога и запуск виртуального хоста
function start-virtual-host() {
    HOST_NAME=$1
    DIR_NAME=/var/www/${HOST_NAME}
    USER=$2
    if [[ -d ${DIR_NAME} ]]; then
        echo "Каталог ${DIR_NAME} уже существует";
    else
        su - ${USER} -c "mkdir ${DIR_NAME}"
        echo "Каталог ${DIR_NAME} был успешно создан";
    fi

    a2ensite ${HOST_NAME}.conf
    a2enmod rewrite
    service apache2 reload
}

# Удаляем виртуальный хост
function delete-virtual-host() {
    HOST_NAME=$1
    FILENAME=/etc/apache2/sites-available/${HOST_NAME}.conf

    if [ -f ${FILENAME} ] ; then
        rm ${FILENAME}
    else
        echo "Фаил не существует"
    fi

    service apache2 reload
}

# Включаем нужные модули apache
function enabled_fpm_modules() {
    a2enmod actions fcgid alias proxy_fcgi
    service apache2 restart
}