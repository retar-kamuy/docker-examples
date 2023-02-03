FROM centos:7
ENV container docker
ARG VER="3.10.9"
ARG SCL_VER 9
ARG PREFIX="/usr/local/Python"
WORKDIR /root/
RUN yum update -y \
    && yum install -y openssl-devel bzip2-devel zlib-devel libffi-devel \
    && yum groupinstall -y "Development Tools" \
    && yum install -y epel-release \
    && yum install -y openssl11 openssl11-devel \
    && yum install -y scl-utils centos-release-scl \
    && yum install -y devtoolset-${SCL_VER} \
    && scl enable devtoolset-${SCL_VER} 'gcc -v' \
    && source scl_source enable devtoolset-${SCL_VER} \
    && curl -OL https://www.python.org/ftp/python/${VER}/Python-${VER}.tgz \
    && tar -xzf Python-${VER}.tgz \
    && cd Python-${VER} \
    && export CFLAGS=$(pkg-config --cflags openssl11) \
    && export LDFLAGS=$(pkg-config --libs openssl11) \
    && yum install -y tcl-devel tk-devel sqlite-devel gdbm-devel xz-devel liblzma-dev lzma-dev ncurses-devel uuid-devel readline-devel \
    && ./configure --prefix=${PREFIX} \
    && make -j `nproc` \
    && make install \
    && tar -C $(dirname ${PREFIX}) -zxvf $(basename ${PREFIX}).tar.gz $(basename ${PREFIX}) \
    && cd .. \
    && rm -rf Python-${VER}
CMD ["/usr/sbin/init"]
