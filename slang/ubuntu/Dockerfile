FROM ubuntu:22.04
ARG TAG="4.0"
ARG PREFIX="/opt/slang"
ENV CC clang
ENV CXX clang++
WORKDIR /root/
RUN wget -qO /usr/local/bin/ninja.gz https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip \
    && gunzip /usr/local/bin/ninja.gz \
    && chmod a+x /usr/local/bin/ninja \
    && apt-get -y install git clang python3 cmake \
    && git clone https://github.com/MikePopoloski/slang.git \
    && cd slang \
    && cmake -GNinja -Bbuild \
        -DCMAKE_C_COMPILER=${CC} \
        -DCMAKE_CXX_COMPILER=${CXX} \
    && cd build \
    && ninja \
    && cmake --install . --strip --prefix ${PREFIX} \
    && chmod -R a+x ${PREFIX}
ENV PATH ${PREFIX}/bin:${PATH}
USER nobody
WORKDIR /tmp