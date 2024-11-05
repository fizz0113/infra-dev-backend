ARG VERSION
FROM golang:${VERSION}

### skip some confirm
ENV DEBIAN_FRONTEND=noninteractive

### update source
RUN apt update && apt upgrade -y

### tools
RUN  apt install -y \
  libncurses5-dev build-essential bison flex bc \
  automake autopoint autoconf libtool pkg-config \
  curl wget tar zip unzip bzip2 xz-utils gzip \
  make cmake gcc g++ ssh git vim less \
  bash zsh \
  net-tools iputils-ping tcpdump

### goenv
RUN git clone https://github.com/syndbg/goenv.git /root/.goenv

