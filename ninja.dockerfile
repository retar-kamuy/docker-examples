
FROM rockylinux:8
WORKDIR /root/
RUN dnf -y install gcc-c++ git cmake \
    && git clone https://github.com/ninja-build/ninja.git \
    && cd ninja \
    && cmake -Bbuild-cmake \
    && cmake --build build-cmake -j$(nproc)