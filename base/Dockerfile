FROM archlinux:base

COPY ./etc/ /etc/

ENV LANG=en_US.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && pacman -Sy \
  && pacman -S --needed --noconfirm sudo which neovim ripgrep git starship git-delta bash-completion \
  && pacman -S --needed --noconfirm dua-cli exa xplr bottom hexyl procs miniserve helm kubectl kubectx \
  && pacman -Scc --noconfirm \
  && echo 'root:root' | chpasswd

COPY ./root/ /root/
