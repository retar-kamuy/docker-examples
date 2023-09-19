FROM ubuntu:22.04
ARG TAG="5.014"
ARG PREFIX="/opt/verilator"
ENV CC clang
ENV CXX clang++
ENV SYSTEMC_HOME /opt/systemc-2.3.3
ENV SYSTEMC_INCLUDE $SYSTEMC_HOME/include
WORKDIR /root/
RUN wget -qO /usr/local/bin/ninja.gz https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip \
    && gunzip /usr/local/bin/ninja.gz \
    && chmod a+x /usr/local/bin/ninja \
    && apt-get -y install git help2man perl python3 make autoconf g++ flex bison ccache \
    && apt-get -y install libgoogle-perftools-dev numactl perl-doc \
    && apt-get -y install libfl2 \
    && apt-get -y install libfl-dev \
    && apt-get -y install zlibc zlib1g zlib1g-dev \
    && apt-get -y install cmake \
    && git clone https://github.com/verilator/verilator \
    && unsetenv VERILATOR_ROOT \
    && unset VERILATOR_ROOT \
    && cd verilator \
    && git checkout v$TAG \
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
    && chmod -R o+rx ${PREFIX}
ENV VERILATOR_ROOT ${PREFIX}
ENV PATH ${VERILATOR_ROOT}/bin:$PATH
USER nobody
WORKDIR /tmp