IMAGE = centos:7
CONTAINER = centos7-verilator

GCC_VER = 9.5.0
VERILATOR_VER = 5.006

pull:
	docker pull $(IMAGE)

gcc:
	echo Building centos7-gcc:latest
	docker build --build-arg VER=$(GCC_VER)) \
		-t centos7-gcc:latest . -f gcc.dockerfile

gcc.tar.gz: gcc
	echo Exporting gcc in centos7-gcc:latest
	docker container create --name extract centos7-gcc:latest
	docker container cp extract:gcc.tar.gz ./gcc
	docker container rm -f extract

verilator: gcc.tar.gz
	echo Building centos7-verilator:latest
	docker build --build-arg VER=$(VERILATOR_VER) \
		--no-cache -t centos7-verilator:latest . -f verilator.dockerfile

run:
	docker run -it --detach --privileged --name $(CONTAINER) --env TZ=Asia/Tokyo $(CONTAINER)

exec:
	docker exec -it $(CONTAINER) /usr/bin/bash

test:
	docker exec -it --workdir /root/test_our centos7-test ./test.sh

commit:
	docker commit $(CONTAINER) $(CONTAINER):latest

rm:
	docker rm $(CONTAINER)
