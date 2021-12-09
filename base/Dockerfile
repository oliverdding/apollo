FROM ubuntu:impish

ENV LANG en_US.UTF-8

RUN apt-get -y update \
    && apt -y --no-install-recommends install gnupg2 apt-transport-https ca-certificates curl zip unzip tar locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && apt -y clean all \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'root:root' | chpasswd

COPY ./etc/ /etc/

RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && curl https://baltocdn.com/helm/signing.asc | apt-key add - \
    && apt-get -y update \
    && apt -y --no-install-recommends install dash neovim ripgrep git bash-completion zoxide fzf exa hexyl kubectl helm \
    && apt -y clean all \
    && mkdir -p /root/.local/bin /root/Developer /root/Temporary \
    && TEMP_DEB="$(mktemp)" && curl -s -L -o "$TEMP_DEB" 'https://github.com/dandavison/delta/releases/download/0.11.2/git-delta_0.11.2_amd64.deb' && dpkg -i "$TEMP_DEB" && rm -f "$TEMP_DEB" \
    && sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y -p unknown-linux-gnu -b /root/.local/bin -a x86_64 \
    && curl https://raw.githubusercontent.com/birdayz/kaf/master/godownloader.sh | BINDIR=$HOME/.local/bin bash \
    && curl -s -L https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz | tar -xzf - -C ~/.local/bin && mv ~/.local/bin/krew-linux_amd64 ~/.local/bin/kubectl-krew && rm -f ~/.local/bin/LICENSE \
    && export KREW_ROOT=$XDG_DATA_HOME/krew \
    && export PATH=$HOME/.local/bin:$HOME/.local/share/cargo/bin:$HOME/.local/share/krew/bin:$PATH \
    && kubectl krew update \
    && kubectl krew install ns ctx

COPY ./root/ /root/
