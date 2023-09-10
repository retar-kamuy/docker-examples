FROM centos:7
ENV container docker
ARG VER="9.5.0"
ARG PREFIX="/usr/local/gcc"
WORKDIR /root/
RUN yum install -y gcc gcc-c++ glibc-devel.i686 libgcc.i686 gmp-devel mpfr-devel libmpc-devel make \
    && curl -OL https://ftp.jaist.ac.jp/pub/GNU/gcc/gcc-9.5.0/gcc-9.5.0.tar.xz \
    && tar Jxvf gcc-${VER}.tar.xz --remove-file \
    && cd gcc-${VER} \
    && ./configure --enable-languages=c,c++ --enable-multilib --prefix=${PREFIX} \
    && make -j `nproc` \
    && make install \
    && tar -C $(dirname ${PREFIX}) -zxvf $(basename ${PREFIX}).tar.gz $(basename ${PREFIX}) \
    && cd .. \
    && rm -rf gcc-${VER}
CMD ["/usr/sbin/init"]
