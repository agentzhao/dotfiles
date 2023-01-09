### fedora

https://spins.fedoraproject.org/en/kde/

todo

- view files from windows
- sway (rounded windows)

# Wifi

```
nmtui
nmcli radio wifi on
nmcli radio wwan off
nmcli device wifi list
nmcli device connect SSID_or_BSSID password password hidden yes
nmcli device disconnect ifname eth0
nmcli con
nmcli con up name_or_uuid
```

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable atim/lazygit -y

sudo dnf update

sudo dnf install dnf-plugins-core gh nvim snapd lazygit clipman ripgrep bat syncthing
sudo dnf install discord stow zsh tmux kitty NetworkManager-tui clipman

sudo ln -s /var/lib/snapd/snap /snap # enable classic snap support
snap install spotify
```

# sway

```
sudo dnf install sway waybar swaylock swayidle grimshot light pavucontrol azote mako
```

# docker

```
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/hyperupcall/autoenv ~/.autoenv
```

# nvim stuff

```
npm install --save-dev --save-exact prettier
pip3 install black
npm install -g tree-sitter-cli prettier eslint_d
```

# hack font

```
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git sparse-checkout add patched-fonts/Hack
./install.sh Hack
```

# languages

```
sudo dnf install python3.11 python3-pip
pip3 install pynvim

sudo dnf install gcc clang golang java-17-openjdk.x86_64

sudo dnf install nodejs npm
```

# bluetooth

```
rfkill unblock all
bluetoothctl power on
```

# vlc media player

```
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install vlc
```

# wofi

- drun - searches $XDG_DATA_HOME/applications and $XDG_DATA_DIRS/applications for desktop files and allows them to be run by selecting them.
- In the event $XDG_DATA_HOME is not specified it defaults to ~/.local/share. If $XDG_DATA_DIRS is not specified it defaults to /usr/local/share:/usr/share.

# misc

```
flatpak install flathub us.zoom.Zoom
```
