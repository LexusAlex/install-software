## Ansible
ansible-ping-myserver:
	ansible myserver -i $(INVENTORY_FILE_UBUNTU) -u root -m ping
ansible-poweroff-myserver:
	ansible -m shell -a "init 0" myserver -i $(INVENTORY_FILE_UBUNTU) -u root
ansible-reboot-myserver:
	ansible -m shell -a "reboot" myserver -i $(INVENTORY_FILE_UBUNTU) -u root
ansible-myserver:
	#ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root -t update
	ansible-playbook -i $(INVENTORY_FILE_UBUNTU) ubuntu/2004/ansible/ubuntu.yml -l myserver -u root -t php