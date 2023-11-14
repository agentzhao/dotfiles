#!/usr/bin/env bash

alias v='nvim'

alias os=lsb_release -sd
alias sudo="sudo " # Allows for aliases to work with sudo
alias cl="clear"
alias apt-get='apt-get -q -o Dpkg::Progress=true -o Dpkg::Progress-Fancy=true -o APT::Get::AutomaticRemove=true ' # Nicer ouput
alias grep='grep -sI --color=auto' # Colorful (auto) 'grep' output.

alias lsa='ls -A' # show all files.
alias lsl='ls -nph' # lots of information.
alias lsla='ls -Anph' # but also show all files.
alias home='cd ~'

# files
alias rm='rm -v'
alias mv='mv -v'
alias mkdir='mkdir -v -p'
alias cp='cp -v'
alias ln='ln -v'
alias chown='chown -v'
alias chmod='chmod -v'
alias rmdir='rmdir -v -i'

# Fast upwards navigation
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."

# Rerun last command with sudo
# alias please='sudo "$BASH" -c "$(history -p !!)"'
alias pls="sudo !!"

# Docker
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dim="docker images"
alias dps="docker ps -s"
alias dpsa="docker ps -as"
alias dsp="docker system prune --all"
alias dre="docker restart"
alias dat="docker attach"
alias dstop="docker stop"
alias dvls="docker volume ls"
alias drmi="docker rmi"
alias dex="docker exec -it"
alias lzdr='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /dotfiles/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
alias lzd='lazydocker'
alias dcrb="docker-compose build --no-cache"

# Plugins
alias fd=fdfind

# My stuff
alias chksum='md5sum --ignore-missing --quiet -c' # check md5 hash
alias ifconfig='ip address'
alias ipconfig='ip address'

# Bitwarden
alias bwp="bw list item --response --search"
alias bwg="bw generate -ulns --length 16"
alias bws="bw status"

# tmux
alias t='tmux'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias trs='tmux rename-session -t'
alias 256colors='for i in {0..255}; do  printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done'

alias npmadd='npm install --save --package-lock-only --no-package-lock'

# network wifi
alias wifi='nmcli radio wifi on && nmcli device wifi list'
alias wifipw='nmcli -s -g 802-11-wireless-security.psk connection show'
alias hotspot='nmcli dev wifi hotspot ifname wlp2s0 ssid manatabi password "88403930"'

# Misc
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias screen0='swaymsg output eDP-1 toggle'
alias getterm='basename "$(cat "/proc/$PPID/comm")"'
