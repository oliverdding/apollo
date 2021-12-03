FROM oliverdd/apollo:gcc

RUN echo -e '\n### installing rust' && \
    export RUSTUP_HOME=/root/.local/share/rustup && \
    export CARGO_HOME=/root/.local/share/cargo && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --default-host x86_64-unknown-linux-gnu --no-modify-path --default-toolchain nightly --profile default --component llvm-tools-preview clippy rust-analyzer-preview rust-src
