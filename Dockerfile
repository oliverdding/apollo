FROM fedora:latest

COPY ./etc/ /etc/

ENV LANG=en_US.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && sudo dnf -q -y install https://mirrors.ustc.edu.cn/rpmfusion/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.ustc.edu.cn/rpmfusion/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
  && dnf makecache \
  && dnf -q -y install unzip zip findutils ncurses tar neovim ripgrep git starship git-delta bash-completion \
  && dnf -q -y install dua-cli exa hexyl procs \
  && dnf -q -y install gcc gdb \
  && dnf clean all \
  && curl -s -L https://go.dev/dl/go1.15.15.linux-amd64.tar.gz | tar -xvzf - -C /usr/local/go/ \
  && export SDKMAN_DIR=/root/.local/share/sdkman && curl -s "https://get.sdkman.io" | bash \
  && sed -i 's/sdkman_auto_answer=false/sdkman_auto_answer=true/' /root/.local/share/sdkman/etc/config \
  && sdk install java 8.0.292.hs-adpt \
  && sdk default java 8.0.292.hs-adpt \
  && sdk install scala 2.11.12 \
  && sdk install scala 2.12.15 \
  && sdk default scala 2.11.12 \
  && sdk install sbt 1.3.8 \
  && sdk default sbt 1.3.8 \
  && echo 'root:root' | chpasswd

COPY ./root/ /root/
