FROM ubuntu:22.04
ENV container docker
ARG VERSION="v5.002"
RUN apt-get update; \
    apt-get install -y git perl python3 make autoconf g++ flex bison ccache; \
    apt-get install -y libgoogle-perftools-dev numactl perl-doc; \
    apt-get install -y libfl2; \
    apt-get install -y libfl-dev; \
    apt-get install -y zlibc zlib1g zlib1g-dev; \
    git clone https://github.com/verilator/verilator; \
    unsetenv VERILATOR_ROOT; \
    unset VERILATOR_ROOT; \
    cd verilator; \
    git pull; \
    git checkout ${VERSION}; \
    autoconf; \
    ./configure --prefix=/usr/local/verilator-${VERSION}; \
    make -j `nproc`; \
    make install; \
    cd ..; \
    rm -rf verilator
