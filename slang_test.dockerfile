FROM centos:7
ENV container docker
WORKDIR /root/
COPY gcc.tar.gz ./
COPY slang.tar.gz ./
COPY test_slang ./test
ENV PATH /usr/local/gcc/bin:$PATH
ENV PATH /usr/local/slang/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/gcc/lib:/usr/local/gcc/lib64:$LD_LIBRARY_PATH
RUN tar -C /usr/local -zxvf gcc.tar.gz --remove-file \
    && tar -C /usr/local -zxvf slang.tar.gz --remove-file \
    && chmod 744 test/run.sh
CMD ["/usr/sbin/init"]
