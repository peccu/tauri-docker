FROM ubuntu:22.04

# install tauri deps
# needs node.js ?
RUN apt-get update \
    && apt-get install -y \
    libwebkit2gtk-4.0-dev \
    build-essential \
    curl \
    wget \
    file \
    libssl-dev \
    libgtk-3-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev

# install rust
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
RUN /root/.cargo/bin/rustup update

# install bun
RUN apt-get install -y unzip
RUN curl -fsSL https://bun.sh/install | bash

# cross-platform builds
RUN apt-get install -y \
    nsis \
    lld \
    llvm
RUN /root/.cargo/bin/rustup target add x86_64-pc-windows-msvc
RUN /root/.cargo/bin/cargo install xwin
RUN /root/.cargo/bin/xwin --accept-license splat --output /root/.xwin

# bunx tauri build --target x86_64-pc-windows-msvc
# then the target is in
# target/x86_64-pc-windows-msvc/release/bundle/nsis/

# refs
# tauri
# https://tauri.app/v1/guides/building/cross-platform#experimental-build-windows-apps-on-linux-and-macos
# bun
# https://bun.sh/docs/installation
# rust
# https://forge.rust-lang.org/infra/other-installation-methods.html
