## Ansible
ansible-ping-ubuntu2004:
	ansible ubuntu2004 -i ubuntu/ansible/inventory.ini -u root -m ping
ansible-ubuntu2004:
	#ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root -t update
	ansible-playbook -i ubuntu/ansible/inventory.ini ubuntu/2004/ansible/ubuntu.yml -l ubuntu2004 -u root
## Docker
docker-debian11-mysql:
	docker-compose -f debian/11/docker/docker-compose.yml --profile mysql up -d