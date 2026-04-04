FROM fedora:latest

# ── System packages ──────────────────────────────────────────────────────────
RUN dnf install -y --setopt=install_weak_deps=False \
    # Core utilities
    git curl wget tar unzip gzip xz \
    make gcc \
    procps-ng findutils util-linux which \
    tzdata nano vim \
    bash-completion \
    # Modern CLI replacements (all in Fedora repos)
    bat eza zoxide fzf ripgrep fd-find \
    btop \
    jq \
    ncdu dust \
    procs tokei \
    git-delta \
    sqlite \
    # Python
    python3 \
    && dnf clean all

# ── Timezone ─────────────────────────────────────────────────────────────────
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ── uv (Python package manager) ───────────────────────────────────────────────
RUN curl -LsSf https://astral.sh/uv/install.sh | UV_INSTALL_DIR=/usr/local/bin sh

# ── Starship prompt ───────────────────────────────────────────────────────────
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes --bin-dir /usr/local/bin

# ── Runtime directories (volumes will overlay these) ─────────────────────────
RUN mkdir -p /root/.local/share/bash /root/.local/share/zoxide

# ── Shell config ──────────────────────────────────────────────────────────────
COPY .devcontainer/bashrc /root/.bashrc
RUN mkdir -p /root/.config
COPY .devcontainer/starship.toml /root/.config/starship.toml

ENV TERM=xterm-256color
ENV SHELL=/bin/bash
