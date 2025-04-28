# Fedora

todo

- view files from windows
- sway (rounded windows)
- fix waybar calendar scroll

### tools to install

`sudo dnf install ydiff`

### dark mode

```
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
```

### finding missing commands

```
dnf provides chsh
dnf provides */chsh
```

### displays

`wdisplays` for enabling and disabling monitors
`wl-mirror <output>` for duplicating screen, `swaymsg -t get_outputs` to get outputs

### connecting to wifi

`ifconfig -a` to find network interface

`wlp2s0` for wireless

```
nmcli connection add type wifi ifname wlp2s0 con-name Wireless@SGx ssid Wireless@SGx
nmcli connection edit Wireless@SGx
set 802-1x.eap peap
set 802-1x.phase2-auth mschapv2
set 802-1x.identity <USERNAME>
set 802-1x.password <PASSWORD>
set wifi-sec.key-mgmt wpa-eap
save
activate
Ctrl + D
```

### changing shell

```
chsh -s /bin/zsh
oat /etc/passwd | grep `cd; pwd` # check which shell is listed
```

`chsh -l` # run this, if you see

```
/usr/bin/zsh
/bin/zsh
```

then use `chsh -s /usr/bin/zsh`

### Wifi

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

sudo dnf install dnf-plugins-core gh nvim snapd lazygit clipman ripgrep bat syncthing p7zip
sudo dnf install discord stow zsh tmux kitty NetworkManager-tui clipman

sudo ln -s /var/lib/snapd/snap /snap # enable classic snap support
snap install spotify

# optional
p7zip-plugins
```

### sway

```
sudo dnf install sway waybar swaylock swayidle grimshot light pavucontrol azote mako
```

### docker

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

### nvim stuff

```
npm install --save-dev --save-exact prettier
pip3 install black
npm install -g tree-sitter-cli prettier eslint_d
```

### other languges

`sudo dnf install fcitx5`

### hack font

```
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git sparse-checkout add patched-fonts/Hack
./install.sh Hack
```

### languages

```
sudo dnf install python3.11 python3-pip
pip3 install pynvim

sudo dnf install gcc clang golang java-17-openjdk.x86_64

sudo dnf install nodejs npm
```

### bluetooth

```
rfkill unblock all
bluetoothctl power on
```

### vlc media player

```
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install vlc
```

### wofi

- drun - searches $XDG_DATA_HOME/applications and $XDG_DATA_DIRS/applications for desktop files and allows them to be run by selecting them.
- In the event $XDG_DATA_HOME is not specified it defaults to ~/.local/share. If $XDG_DATA_DIRS is not specified it defaults to /usr/local/share:/usr/share.

### misc

```
flatpak install flathub us.zoom.Zoom
```

### cleaning up system memory

`ncdu /home/zhao`

### sway and workstation shenanigans

`sudo dnf group install Sway Workstation`

`sudo dnf swap fedora-release-identity-sway fedora-release-identity-workstation`

[checking installed kernels using grubby](https://www.baeldung.com/linux/grub-menu-management)
`sudo grubby --info=ALL`

### sway unsupported gpu

add --unsupported-gpu flag to /usr/share/wayland-sessions

### random tools

- zathura - document viewer

### auto export all env variables in .env file

- `set -a` to auto export, `set +a` for manual

### wireshark on linux

change owner of dumpcap from root to user acc `sudo chown -R $LOGNAME /usr/bin/dumpcap` see: [https://askubuntu.com/a/919405]

### add yourself into a group

sudo usermod -aG user_group $(whoami)

### conflicting i686 and x86_64 package (32 vs 64 bit)

`file /usr/share/man/man5/cert9.db.5.gz from install of nss-3.107.0-1.fc40.i686 conflicts with file from package nss-3.104.0-1.fc40.x86_64`

`rpm -qa | grep nss`

`sudo dnf remove nss.i686`
