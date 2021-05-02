FROM debian:stretch-slim
ARG v8_VERSION=9.2
WORKDIR /build
RUN apt update && apt upgrade -y && apt install -y git curl python lsb-release sudo
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH="/build/depot_tools:${PATH}"
RUN gclient
RUN fetch v8
WORKDIR /build/v8
RUN git checkout branch-heads/9.2 &> COMMIT
RUN cat ./COMMIT
RUN gclient sync
LABEL org.opencontainers.image.source="https://github.com/dockerimages/v8-build"
#RUN exit 1
