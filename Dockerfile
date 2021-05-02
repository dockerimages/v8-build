FROM debian:stretch-slim

WORKDIR /build
RUN apt update && apt upgrade -y && apt install -y git curl python lsb-release sudo
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH="/build/depot_tools:${PATH}"
RUN gclient
RUN fetch v8
WORKDIR /build/v8
RUN git checkout branch-heads/8.8 > COMMIT
RUN cat ./COMMIT
#RUN exit 1
