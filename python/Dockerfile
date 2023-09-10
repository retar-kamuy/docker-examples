FROM centos:7
ENV container docker
ARG VER="8.6.13"
ARG PREFIX="/usr/local/tcl"
WORKDIR /root/
RUN yum install -y gcc make \
    && curl -OL https://prdownloads.sourceforge.net/tcl/tcl${VER}-src.tar.gz \
    && tar -zxvf tcl${VER}-src.tar.gz --remove-file \
    && cd tcl${VER}/unix \
    && ./configure --prefix=${PREFIX} \
    && make -j `nproc` \
    && make install

FROM centos:7
ENV container docker
ARG VER="8.6.13"
ARG PREFIX="/usr/local/tk"
WORKDIR /root/
COPY --from=0 /root/tcl${VER} /root/tcl${VER}
RUN yum install -y gcc make libX11-devel \
    && curl -OL https://prdownloads.sourceforge.net/tcl/tk${VER}-src.tar.gz \
    && tar -zxvf tk${VER}-src.tar.gz --remove-file \
    && cd tk${VER}/unix \
    && ./configure --prefix=${PREFIX} --with-tcl=/root/tcl${VER}/unix \
    && make -j `nproc` \
    && make install

FROM centos:7
ENV container docker
ARG VER="3.10.9"
ARG SCL_VER 9
ARG PREFIX="/usr/local/Python"
WORKDIR /root/
COPY --from=0 /usr/local/tcl /usr/local/tcl
COPY --from=1 /usr/local/tk /usr/local/tk
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
    && export PATH=/usr/local/tcl/bin:/usr/local/tk/bin:$PATH \
    && export CFLAGS="-I/usr/local/tcl/include -I/usr/local/tk/include" \
    && export CFLAGS="$(pkg-config --cflags openssl11) $CFLAGS" \
    && export CPPFLAGS="-I/usr/local/tcl/include -I/usr/local/tk/include" \
    && export LDFLAGS="-L/usr/local/tcl/lib -L/usr/local/tk/lib" \
    && export LDFLAGS="$(pkg-config --libs openssl11) $LDFLAGS" \
    && export PKG_CONFIG_PATH="/usr/local/tcl/lib/pkgconfig /usr/local/tk/lib/pkgconfig" \
    && export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/tcl/include -I/usr/local/tk/include' --with-tcltk-libs='-L/usr/local/tcl/lib -L/usr/local/tk/lib -ltcl8.6 -ltk8.6'" \
    && yum install -y tcl-devel tk-devel sqlite-devel gdbm-devel xz-devel liblzma-dev lzma-dev ncurses-devel uuid-devel readline-devel \
    && ./configure --prefix=${PREFIX} \
    && make -j `nproc` \
    && make install \
    && tar -C $(dirname ${PREFIX}) -zxvf $(basename ${PREFIX}).tar.gz $(basename ${PREFIX}) \
    && cd .. \
    && rm -rf Python-${VER}
CMD ["/usr/sbin/init"]
