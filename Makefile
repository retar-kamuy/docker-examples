pull:
	podman pull rockylinux:8

build:
	podman build --rm -t r8-riscv .

run:
#	podman run -it --detach --privileged --name rockylinux --publish 80:80 --env TZ=Asia/Tokyo rockylinux:8
	podman run -it --detach --privileged --name r8-riscv --env TZ=Asia/Tokyo /r8-riscv

exec:
	podman exec -it r8-riscv /usr/bin/bash

rm:
	podman rm 49cc3f73bcf0