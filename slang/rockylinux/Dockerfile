FROM rockylinux:9
ARG TAG="4.0"
ARG PREFIX="/usr/local/slang"
WORKDIR /root/
RUN dnf -y install epel-release \
    && dnf config-manager --set-enabled crb \
    && dnf -y install ninja-build \
    && dnf -y install git gcc-c++ python3 cmake \
    && git clone https://github.com/MikePopoloski/slang.git \
    && cd slang \
    && cmake -GNinja -Bbuild \
        -DCMAKE_C_COMPILER=gcc \
        -DCMAKE_CXX_COMPILER=gcc \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/slang \
    && cd build \
    && ninja \
    && cmake --install . --prefix /opt/slang \
    && chmod -R o+rx /opt/slang
ENV PATH /opt/slang/bin:$PATH
USER nobody
WORKDIR /tmp