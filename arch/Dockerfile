FROM archlinux:base-devel

ENV \
  UID="1000" \
  GID="1000" \
  UNAME="zhao" \
  SHELL="/bin/zsh" \
  DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

RUN sudo sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen \
  && sudo locale-gen

RUN pacman -Syu --noprogressbar --noconfirm --needed \
  cmake clang unzip ninja git curl wget openssh zsh reflector htop \
  archlinux-keyring \
  && useradd -m -s "${SHELL}" "${UNAME}" \
  && echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
  && sudo reflector -p https -c us --score 20 --connection-timeout 1 --sort rate --save /etc/pacman.d/mirrorlist \
  && wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem \
  -o /usr/share/ca-certificates/trust-source/rds-combined-ca-bundle.pem \
  && update-ca-trust

USER zhao
WORKDIR /home/zhao/

RUN git clone https://aur.archlinux.org/yay.git \
  && cd yay \
  && makepkg -si --noprogressbar --noconfirm \
  && cd .. \
  && rm -Rf yay

RUN yay -Syu --noprogressbar --noconfirm --needed \
  python3 python-pip nodejs-lts-gallium npm clang \
  eslint_d prettier stylua git-delta github-cli lazygit \
  tmux bat fzf fd ripgrep kitty-terminfo \
  neovim neovim-remote nvim-packer-git \
  oh-my-zsh-git zsh-theme-powerlevel10k-git zsh-autosuggestions zsh-completions-git zsh-syntax-highlighting-git \
  docker docker-compose lazydocker \
  zoxide-git ncdu \
  # dotnet-host-bin dotnet-sdk-3.1-bin aspnet-runtime-3.1-bin \
  # dotnet-runtime-bin netcoredbg \
  # mssql-tools maven \
  # aws-cli-v2-bin aws-session-manager-plugin aws-vault pass \
  && sudo pip --disable-pip-version-check install pynvim \
  && sudo npm install -g neovim @bitwarden/cli \
  && yay -Scc --noprogressbar --noconfirm

# not sure if package is needed
# # netcoredbg has conflicts when it's part of the block above
# RUN yay -Syu --noprogressbar --noconfirm --needed netcoredbg \
#   && yay -Scc --noprogressbar --noconfirm

# oh my zsh and powerlevel10k
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# I don't know why I have to set this again, but I do...
RUN sudo sed -i '/en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen \
  && sudo locale-gen

# This probably only needs to be run on the host
# RUN echo fs.inotify.max_user_watches=524288 \
#    | sudo tee /etc/sysctl.d/40-max-user-watches.conf \
#      && sudo sysctl --system

ENV TERM="xterm-256color"
CMD ["tmux"]
