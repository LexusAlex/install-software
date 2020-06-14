#!/usr/bin/env bash
# Системные функции

function apt-install() {
    apt update
    apt install vim -y
}
