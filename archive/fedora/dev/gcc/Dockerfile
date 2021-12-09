FROM oliverdd/apollo:base

RUN dnf makecache && \
    dnf -q -y install gcc gdb && \
    dnf clean all
