#!/usr/bin/env bash

DIR=$(dirname "$(readlink -e "$0")")

source ${DIR}/system.sh
source ${DIR}/apache.sh

apt-install
install-snd-apache
disabled-localhost