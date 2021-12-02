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
    echo -e '\n## installing packages' && \
    sudo dnf -q -y install https://mirrors.ustc.edu.cn/rpmfusion/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.ustc.edu.cn/rpmfusion/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    dnf -q -y install openssh-server which file unzip zip findutils ncurses tar neovim ripgrep git starship git-delta bash-completion zoxide fzf && \
    dnf -q -y install dua-cli exa hexyl procs && \
    dnf -q -y install kubectl kubectx k9s && \
    dnf -q -y install gcc gdb && \
    dnf clean all && \
    mkdir -p /root/.local/bin && \
    curl https://raw.githubusercontent.com/birdayz/kaf/master/godownloader.sh | BINDIR=$HOME/.local/bin bash && \
    curl -s -L https://get.helm.sh/helm-v2.15.2-linux-amd64.tar.gz | tar -xzf - -C /root/.local/bin && mv /root/.local/bin/linux-amd64/helm /root/.local/bin/helm2 && mv /root/.local/bin/linux-amd64/tiller /root/.local/bin && rm -rf /root/.local/bin/linux-amd64 && \
    curl -s -L https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz | tar -xzf - -C /root/.local/bin && mv /root/.local/bin/linux-amd64/helm /root/.local/bin/helm3 && rm -rf /root/.local/bin/linux-amd64 && \
    ln -s -f ~/.local/bin/helm3 ~/.local/bin/helm && \
    echo -e '\n### installing go' && \
    curl -s -L https://go.dev/dl/go1.15.15.linux-amd64.tar.gz | tar -xzf - -C /usr/local/ && \
    echo -e '\n### installing java, scala and sbt' && \
    export SDKMAN_DIR=/root/.local/share/sdkman && curl -s "https://get.sdkman.io" | bash && \
    sed -i 's/sdkman_auto_answer=false/sdkman_auto_answer=true/' /root/.local/share/sdkman/etc/config && \
    source "/root/.local/share/sdkman/bin/sdkman-init.sh" && \
    sdk install java 8.0.312-zulu && \
    sdk default java 8.0.312-zulu && \
    sdk install scala 2.11.12 && \
    sdk install scala 2.12.15 && \
    sdk default scala 2.11.12 && \
    sdk install sbt 1.3.8 && \
    sdk default sbt 1.3.8 && \
    rm -rf /root/.local/share/sdkman/tmp/* && \
    echo -e '\n### installing rust' && \
    export RUSTUP_HOME=/root/.local/share/rustup && \
    export CARGO_HOME=/root/.local/share/cargo && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --default-host x86_64-unknown-linux-gnu --no-modify-path --default-toolchain nightly --profile default --component llvm-tools-preview clippy rust-analyzer-preview rust-src

COPY ./root/ /root/

EXPOSE 22

CMD ssh-keygen -A; /usr/sbin/sshd -D
