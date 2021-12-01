FROM fedora:latest

COPY ./etc/ /etc/

ENV LANG=en_US.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && sudo dnf install https://mirrors.ustc.edu.cn/rpmfusion/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.ustc.edu.cn/rpmfusion/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
  && dnf makecache \
  && dnf -q -y install neovim ripgrep git starship git-delta bash-completion \
  && dnf -q -y install dua-cli exa xplr bottom hexyl procs miniserve helm kubectl kubectx \
  && dnf clean all \
  && echo 'root:root' | chpasswd

COPY ./root/ /root/
