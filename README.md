Инсталляция ПО различными способами

Используемые программы:

[ansible](https://github.com/ansible/ansible/tags)

Роли настраиваются индивидуально под каждый проект

Поддерживаемые OC

1. Ubuntu 20.04

Первоначальная настройка ubuntu:

1. ssh alex@192.168.88.161 / ssh alex@10.122.121.34
2. service sshd status
3. sudo passwd root
4. su root
5. sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && sed -i 's/#Port 22/Port 60022/g' /etc/ssh/sshd_config && systemctl restart ssh
6. exit
7. ssh-copy-id -i ~/.ssh/id_rsa.pub -p 60022 root@192.168.88.155
8. Далее все делает ansible

ssh -p 60022 root@192.168.88.155

Файлы, которые нужно создать руками
1. ubuntu/ansible/inventory.ini
2. ubuntu/2004/ansible/roles/mysql-settings/vars/main.yml
3. ubuntu/2004/ansible/roles/mysql-create-user/vars/main.yml
4ubuntu/2004/ansible/roles/postgres-add-data/vars/main.yml

Актуальные версии ПО

1. [Ubuntu](https://en.wikipedia.org/wiki/Ubuntu_version_history)
2. 