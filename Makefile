pull:
	docker pull rockylinux:8

build:
	docker build --rm -t r8-riscv .

run:
#	podman run -it --detach --privileged --name rockylinux --publish 80:80 --env TZ=Asia/Tokyo rockylinux:8
	docker run -it --detach --privileged --name r8-riscv --env TZ=Asia/Tokyo rockylinux:8

exec:
	docker exec -it r8-riscv /usr/bin/bash

rm:
	docker rm r8-riscv