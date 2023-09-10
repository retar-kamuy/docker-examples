FROM c7-gcc:latest
ARG VER="5.006"
ARG PREFIX="/usr/local/verilator"
WORKDIR /root/
COPY gcc.tar.gz ./
ENV PATH /usr/local/gcc/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/gcc/lib:/usr/local/gcc/lib64:$LD_LIBRARY_PATH
RUN tar -C /usr/local -zxvf gcc.tar.gz --remove-file \
    && yum install -y python3 flex bison help2man make autoconf \
    && curl -OL https://github.com/verilator/verilator/archive/refs/tags/v${VER}.tar.gz \
    && tar -zxvf v${VER}.tar.gz --remove-file \
    && cd verilator-${VER} \
    && autoconf \
    && ./configure --prefix=${PREFIX} \
    && make -j `nproc` \
    && make install \
    && tar -C $(dirname ${PREFIX}) -zxvf $(basename ${PREFIX}).tar.gz $(basename ${PREFIX}) \
    && cd .. \
    && rm -rf verilator-${VER}
CMD ["/usr/sbin/init"]
