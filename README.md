Инсталляция ПО различными способами

Используемые программы:

[ansible](https://github.com/ansible/ansible/tags)

Роли настраиваются индивидуально под каждый проект

Поддерживаемые OC

1. Ubuntu 20.04
2. Ubuntu 22.04

Первоначальная настройка ubuntu:

1. service sshd status
2. sudo passwd root
3. ssh alex@192.168.88.161
4. sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && sed -i 's/#Port 22/Port 60022/g' /etc/ssh/sshd_config && systemctl restart ssh
5. ssh-copy-id -i ~/.ssh/id_rsa.pub -p 60022 root@192.168.88.161
6. Далее все делает ansible