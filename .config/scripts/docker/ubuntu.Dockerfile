FROM ubuntu:22.04

LABEL maintainer="agentzhao"

# Essentials
RUN rm -rf /var/lib/apt/lists/* \
  && apt update \
  && apt install -y software-properties-common \
  && apt install -y sudo zsh curl wget git gh build-essential stow autojump file nodejs npm unzip

RUN add-apt-repository -y ppa:deadsnakes/ppa \
  && apt update \
  && apt install -y python3.10

# RUN git config --global --unset https.proxy

RUN CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && brew install fd ripgrep bat autoenv bat fzf 

RUN useradd -s /bin/zsh zhao -u 1000 -U \
  && echo '' >> /etc/sudoers \
  && echo 'zhao ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/zhao
COPY --chown=zhao:zhao . .
RUN chown zhao:zhao /home/zhao
USER zhao

# Oh-My-Zsh
RUN cd ~ && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && sudo chsh -s $(which zsh) $(whoami)
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# Languages
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y # Rust
RUN curl -OL https://go.dev/dl/go1.18.1.linux-amd64.tar.gz && sudo tar -C /usr/local -xvf go1.18.1.linux-amd64.tar.gz && rm go1.18.1.linux-amd64.tar.gz

# Tools
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# Autojump
RUN . /usr/share/autojump/autojump.sh

# Dotfiles
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
RUN git clone https://github.com/agentzhao/dotfiles.git && cd ~/dotfiles && stow -vt ~ */

# Neovim
RUN sudo curl -LO https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz && tar xzvf nvim-linux64.tar.gz && rm nvim-linux64.tar.gz
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN rm -rf ~/.cache/nvim
RUN ~/nvim-linux64/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'
RUN ~/nvim-linux64/bin/nvim --headless +TSUpdateSync +qa

LABEL org.opencontainers.image.title="environment"
LABEL org.opencontainers.image.url="https://github.com/agentzhao/env"
LABEL org.opencontainers.image.source="https://github.com/agentzhao/env.git"
LABEL org.opencontainers.image.authors="agentzhao"
LABEL org.opencontainers.image.created="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

CMD ["/bin/zsh", "-l"]
