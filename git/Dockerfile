FROM centos:7
ENV container docker
ARG VER="-2.17.6"
ARG SCL_VER 9
ARG PREFIX="/usr/local/git"
WORKDIR /root/
RUN yum install -y gcc make curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker \
    && curl -OL https://mirrors.edge.kernel.org/pub/software/scm/git/git-${VER}.tar.gz \
    && tar -zxvf git-${VER}.tar.gz \
    && ./configure --prefix=${PREFIX} \
    && make -j `nproc` \
    && make install \
CMD ["/usr/sbin/init"]
