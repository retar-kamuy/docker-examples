FROM ubuntu:latest
ENV container docker
ARG CLONE_DIR="/usr/local/src/riscv-gnu-toolchain"
ARG RISCV_HOME="/opt/riscv"
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8; \
	apt-get -y install git libelf-dev binutils-dev; \
	apt-get -y install autoconf automake autotools-dev curl python3 libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev; \
	git clone https://github.com/riscv/riscv-gnu-toolchain $CLONE_DIR; \
	mkdir $CLONE_DIR/objdir; \
	$CLONE_DIR/configure --prefix=$RISCV_HOME --with-arch=rv32ima; \
	make;\
	export PATH=$RISCV_HOME/bin:$PATH; \
	rm -rf $CLONE_DIR/objdir; \
	apt-get update; \
	apt-get -y install verilator; \
	cd /usr/local/src; \
	curl -OL https://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.3.tar.gz;\
	tar -zxvf systemc-2.3.3.tar.gz; \
	mkdir objdir; \
	cd objdir; \
	../configure --prefix=/usr/local/systemc-2.3.3; \
	make; \
	make install; \
	cd ..;\
	rm -rf objdir
