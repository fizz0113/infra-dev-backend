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

# sshd
RUN mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config \
    && sed -i 's/#StrictModes yes/StrictModes no/' /etc/ssh/sshd_config

### zsh
RUN bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
COPY ./.zshrc /root/.zshrc
COPY ./.p10k.zsh /root/.p10k.zsh
RUN zsh -c "TERM=xterm source /root/.zshrc"
RUN chsh -s $(which zsh)
### goenv
RUN git clone https://github.com/syndbg/goenv.git /root/.goenv

