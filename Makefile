ping-ubuntu:
	ansible ubuntu2004 -i ubuntu/ansible/inventory.ini -u root -m ping
ubuntu2004:
	#ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root -t update
	ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root