IMAGE		=	ubuntu-22.04
CONTAINER	=	$(IMAGE)-verilator

build:
	docker build --rm -t $(IMAGE) .

run:
	docker run -it --detach --privileged --name $(CONTAINER) $(IMAGE)

start:
	docker start $(CONTAINER)

exec:
	docker exec -it $(CONTAINER) /usr/bin/bash
#	docker exec -it $(CONTAINER) cd tar -C /usr/local/ -zcvf verilator-v5.002.tar.gz /usr/local/verilator-v5.002
#	docker cp $(CONTAINER):verilator-v5.002.tar.gz .

stop:
	docker stop $(CONTAINER)

commit:
	docker commit $(CONTAINER) $(IMAGE)

export:
	docker export --output="$(IMAGE).tar" $(CONTAINER)

artifact:
	docker exec -it $(CONTAINER) tar -zcvf verilator-v5.002.tar.gz /usr/local/verilator-v5.002
	docker cp $(CONTAINER):verilator-v5.002.tar.gz .