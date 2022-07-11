## Ansible
ansible-ping-ubuntu2004:
	ansible ubuntu2004 -i $(INVENTORY_FILE_UBUNTU) -u root -m ping
ansible-poweroff-ubuntu2004:
	ansible -m shell -a "init 0" ubuntu2004 -i $(INVENTORY_FILE_UBUNTU) -u root
ansible-reboot-ubuntu2004:
	ansible -m shell -a "reboot" ubuntu2004 -i $(INVENTORY_FILE_UBUNTU) -u root
ansible-ubuntu2004:
	#ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root -t update
	ansible-playbook -i $(INVENTORY_FILE_UBUNTU) ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root -t mysql-settings