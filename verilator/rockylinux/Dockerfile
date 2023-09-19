FROM rockylinux:8
ARG TAG="5.014"
ARG PREFIX="/opt/verilator"
ENV CC clang
ENV CXX clang++
ENV SYSTEMC_HOME /opt/systemc-2.3.3
ENV SYSTEMC_INCLUDE ${SYSTEMC_HOME}/include
WORKDIR /root/
RUN dnf -y install epel-release \
    && dnf config-manager --set-enabled powertools \
    && dnf -y install ninja-build \
    && dnf -y install git help2man perl python3 make autoconf clang flex bison ccache \
    && dnf -y install gperftools-devel numactl perl-Pod-Perldoc \
    && dnf -y install flex-devel \
    && dnf -y install zlib zlib-devel \
    && dnf -y install cmake \
    && git clone https://github.com/verilator/verilator \
    && unset VERILATOR_ROOT \
    && unset VERILATOR_ROOT \
    && cd verilator \
    && git checkout v${TAG} \
    && mkdir build \
    && cd build \
    && cmake -G Ninja .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${PREFIX} \
        -DCMAKE_C_COMPILER=${CC} \
        -DCMAKE_CXX_COMPILER=${CXX} \
        -DBISON_EXECUTABLE=/usr/bin/bison \
        -DFLEX_EXECUTABLE=/usr/bin/flex \
        -DCMAKE_EXE_LINKER_FLAGS="-lpthread" \
    && ninja \
    && cmake --install . --prefix ${PREFIX} \
    && chmod -R a+x ${PREFIX}
ENV VERILATOR_ROOT ${PREFIX}
ENV PATH ${VERILATOR_ROOT}/bin:${PATH}
USER nobody
WORKDIR /tmp