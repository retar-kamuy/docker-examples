FROM centos:7
ENV container docker
ARG VER="3.25.2"
ARG PREFIX="/usr/local/cmake"
WORKDIR /root/
RUN curl -OL https://github.com/Kitware/CMake/releases/download/v${VER}/cmake-${VER}-linux-x86_64.sh \
    && curl -OL https://github.com/Kitware/CMake/releases/download/v${VER}/cmake-${VER}-linux-x86_64.tar.gz \
    && mkdir ${PREFIX} \
    && chmod 744 cmake-${VER}-linux-x86_64.sh \
    && ./cmake-${VER}-linux-x86_64.sh --prefix=${PREFIX} --skip-license \
    && rm -rf cmake-${VER}-linux-x86_64.*

FROM centos:7
ARG VER="2.0"
ARG PREFIX="/usr/local/slang"
WORKDIR /root/
COPY gcc.tar.gz ./
COPY --from=0 /usr/local/cmake /usr/local/cmake
ENV PATH /usr/local/gcc/bin:$PATH
ENV PATH /usr/local/cmake/bin:$PATH
ENV PATH /usr/local/python/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/gcc/lib:/usr/local/gcc/lib64:$LD_LIBRARY_PATH
RUN tar -C /usr/local -zxvf gcc.tar.gz --remove-file \
    && yum install -y gcc make git python3 \
    && ln -s /usr/bin/python3 /usr/local/bin/python \
    && curl -OL https://github.com/MikePopoloski/slang/archive/refs/tags/v${VER}.tar.gz \
    && tar -zxvf v${VER}.tar.gz --remove-file \
    && cd slang-${VER} \
    && cmake -B build \
    && cmake --build build \
    && cmake --install build --strip --prefix=${PREFIX} \
    && tar -C $(dirname ${PREFIX}) -zxvf $(basename ${PREFIX}).tar.gz $(basename ${PREFIX}) \
    && cd .. \
    && rm -rf slang-${VER}
CMD ["/usr/sbin/init"]
