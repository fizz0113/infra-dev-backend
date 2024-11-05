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

### nvm 
RUN zsh -c "curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash"

### node
RUN zsh -c ". /root/.nvm/nvm.sh; nvm install --lts"

### goenv
RUN git clone https://github.com/syndbg/goenv.git /root/.goenv

### vim
RUN zsh -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
COPY ./.vimrc /root/.vimrc
RUN zsh -c ". /root/.nvm/nvm.sh; vim +'PlugInstall' +qall; vim +'CocInstall -sync coc-go' +qall"
COPY ./coc-settings.json /root/.vim/coc-settings.json
