FROM centos:7
ENV container docker
WORKDIR /root/
COPY gcc.tar.gz ./
COPY verilator.tar.gz ./
COPY test_verilator ./test
ENV PATH /usr/local/gcc/bin:$PATH
ENV PATH /usr/local/verilator/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/gcc/lib:/usr/local/gcc/lib64:$LD_LIBRARY_PATH
RUN yum install -y perl make python3 gcc \
    && tar -C /usr/local -zxvf gcc.tar.gz --remove-file \
    && tar -C /usr/local -zxvf verilator.tar.gz --remove-file \
    && chmod 744 test/run.sh
CMD ["/usr/sbin/init"]
