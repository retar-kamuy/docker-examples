FROM rockylinux:8
ARG TAG="4.0"
ARG PREFIX="/opt/slang"
ENV CC gcc
ENV CXX g++
WORKDIR /root/
RUN dnf -y install epel-release \
    && dnf config-manager --set-enabled powertools \
    && dnf -y install ninja-build \
    && dnf -y install git gcc-toolset-12-gcc-c++ python3 cmake \
    && source scl_source enable gcc-toolset-12 \
    && git clone https://github.com/MikePopoloski/slang.git \
    && cd slang \
    && cmake -GNinja -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${PREFIX} \
        -DCMAKE_C_COMPILER=${CC} \
        -DCMAKE_CXX_COMPILER=${CXX} \
    && cd build \
    && ninja \
    && cmake --install . --prefix ${PREFIX} \
    && chmod -R a+x ${PREFIX}
ENV PATH ${PREFIX}/bin:${PATH}
USER nobody
WORKDIR /tmp