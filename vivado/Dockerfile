FROM rockylinux:8
ARG MOUNT_PATH=/tmp
ARG INSTALLER=Xilinx_Unified_2023.1_0507_1903
ENV CURDIR=/root
WORKDIR ${CURDIR}
COPY ${INSTALLER} ${CURDIR}/
COPY .Xilinx.tar.gz ${CURDIR}/
RUN dnf -y update \
    && dnf -y install glibc-all-langpacks.x86_64 ncurses-compat-libs libX11 \
    && dnf -y install gcc \
    && tar -zxvf .Xilinx.tar.gz \
    && ${MOUNT_PATH}/${INSTALLER}/xsetup --agree XilinxEULA,3rdPartyEULA --batch Install --config /root/.Xilinx/install_config.txt \
    && rm -rf .Xilinx .Xilinx.tar.gz