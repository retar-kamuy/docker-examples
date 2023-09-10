FROM rockylinux:8
ARG TAG llvmorg-16.0.6
WORKDIR /root/
COPY --from=0 /root/ninja/build-cmake/ninja /usr/local/bin/
RUN dnf -y install epel-release \
    && dnf config-manager --set-enabled powertools \
    && dnf -y install ninja-build \
    && dnf -y install git cmake python3 \
    && git clone https://github.com/llvm/llvm-project.git \
    && cd llvm-project \
    && git checkout $TAG \
    && cmake -S llvm -B build -GNinja -DCMAKE_INSTALL_PREFIX=/opt/llvm-project -DCMAKE_BUILD_TYPE=Release \
    && cd build \
    && ninja \
    && chmod -R o+rx /opt/llvm-project
ENV VERILATOR_ROOT /opt/llvm-project
ENV PATH $VERILATOR_ROOT/bin:$PATH
USER nobody
WORKDIR /tmp