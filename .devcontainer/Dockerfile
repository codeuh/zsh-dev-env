FROM fedora:latest

# ── System packages ──────────────────────────────────────────────────────────
RUN dnf install -y --setopt=install_weak_deps=False \
    # Core utilities
    git curl wget tar unzip gzip xz \
    make gcc \
    procps-ng findutils util-linux which \
    tzdata nano vim \
    bash-completion \
    zsh \
    # Modern CLI replacements (all in Fedora repos)
    bat eza zoxide fzf ripgrep fd-find \
    btop \
    jq \
    ncdu dust \
    procs tokei \
    git-delta \
    sqlite \
    python3 pip3 \
    && dnf clean all

# ── Timezone ─────────────────────────────────────────────────────────────────
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ── uv (Python package manager) ───────────────────────────────────────────────
RUN pip3 install --no-cache-dir uv

# ── Oh My Zsh ─────────────────────────────────────────────────────────────────
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# ── Zsh plugins ───────────────────────────────────────────────────────────────
RUN git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting \
        ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ── Runtime directories (volumes will overlay these) ─────────────────────────
RUN mkdir -p /root/.local/share/zsh /root/.local/share/zoxide

# ── Shell config ──────────────────────────────────────────────────────────────
COPY .devcontainer/zshrc /root/.zshrc
COPY .devcontainer/dst-custom.zsh-theme /root/.oh-my-zsh/themes/dst-custom.zsh-theme
COPY .devcontainer/gitconfig /etc/gitconfig

ENV TERM=xterm-256color
ENV SHELL=/bin/zsh
