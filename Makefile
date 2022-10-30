pull:
	docker pull ubuntu:latest

build:
	docker build --rm -t ubuntu-riscv .

run:
#	podman run -it --detach --privileged --name rockylinux --publish 80:80 --env TZ=Asia/Tokyo rockylinux:8
	docker run -it --detach --privileged --name ubuntu-riscv --env TZ=Asia/Tokyo --env LANG=en_US.utf8 ubuntu-riscv

exec:
	docker exec -it ubuntu-riscv /usr/bin/bash

rm:
	docker rm ubuntu-riscv