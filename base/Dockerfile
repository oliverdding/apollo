FROM fedora:latest

ENV LANG en_US.UTF-8

WORKDIR /root

COPY ./etc/ /etc/

RUN echo -e '\n## setting system' && \
    dnf makecache && \
    dnf -q -y install glibc-locale-source glibc-langpack-en dnf-plugins-core && \
    localedef --quiet --force -i en_US -f UTF-8 en_US.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo 'root:root' | chpasswd && \
    dnf -q -y copr enable luminoso/k9s && \
    dnf -q -y copr enable audron/kubectx && \
    echo -e '\n### installing necessary packages' && \
    dnf -q -y install https://mirrors.ustc.edu.cn/rpmfusion/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.ustc.edu.cn/rpmfusion/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    dnf -q -y install zip unzip findutils which file ncurses tar neovim ripgrep git starship git-delta bash-completion zoxide fzf && \
    dnf -q -y install dua-cli exa hexyl procs && \
    dnf -q -y install kubectl kubectx k9s && \
    dnf clean all && \
    rm -rf /root/* && \
    mkdir -p /root/.local/bin && \
    curl https://raw.githubusercontent.com/birdayz/kaf/master/godownloader.sh | BINDIR=$HOME/.local/bin bash && \
    curl -s -L https://get.helm.sh/helm-v2.15.2-linux-amd64.tar.gz | tar -xzf - -C /root/.local/bin && mv /root/.local/bin/linux-amd64/helm /root/.local/bin/helm2 && mv /root/.local/bin/linux-amd64/tiller /root/.local/bin && rm -rf /root/.local/bin/linux-amd64 && \
    curl -s -L https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz | tar -xzf - -C /root/.local/bin && mv /root/.local/bin/linux-amd64/helm /root/.local/bin/helm3 && rm -rf /root/.local/bin/linux-amd64 && \
    ln -s -f ~/.local/bin/helm3 ~/.local/bin/helm

COPY ./root/ /root/
