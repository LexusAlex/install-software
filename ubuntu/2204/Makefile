ansible-ping-ubuntu2204:
	ansible ubuntu2204 -i ubuntu/ansible/inventory.ini -u root -m ping
ansible-poweroff-ubuntu2204:
	ansible -m shell -a "init 0" ubuntu2204 -i ubuntu/ansible/inventory.ini -u root
ansible-reboot-ubuntu2204:
	ansible -m shell -a "reboot" ubuntu2204 -i ubuntu/ansible/inventory.ini -u root
ansible-ubuntu2204:
	#ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root -t update
	ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2204/ansible/ubuntu.yml -l ubuntu2204 -u root