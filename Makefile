
start: start-ubuntu-soft
stop: stop-ubuntu-soft
run-ubuntu-soft:
	docker run --name ubuntu-soft -v ${PWD}/:/root/install-software -p 80:80 -p 8080:8080 -p 3306:3306 -p 21:21 -it -d ubuntu:18.04 /bin/bash

start-ubuntu-soft:
	docker start ubuntu-soft

stop-ubuntu-soft:
	docker stop ubuntu-soft

exec-ubuntu-soft:
	docker exec -it ubuntu-soft /bin/bash -c "cd /root/install-software && /bin/bash"

run-ubuntu-script:
	docker exec -it ubuntu-soft /bin/bash -c "/root/install-software/ubuntu/18.04/main.sh"