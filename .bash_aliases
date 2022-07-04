#!/usr/bin/env bash
alias os=lsb_release -sd
alias sudo="sudo " # Allows for aliases to work with sudo
alias apt-get='apt-get -q -o Dpkg::Progress=true -o Dpkg::Progress-Fancy=true -o APT::Get::AutomaticRemove=true ' # Nicer ouput
alias grep='grep -sI --color=auto' # Colorful (auto) 'grep' output.

alias lsa='ls -A' # show all files.
alias lsl='ls -nph' # lots of information.
alias lsla='ls -Anph' # but also show all files.
alias exp='explorer.exe .'

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
alias please="_ !!"

# Docker
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dim="docker images"
alias dps="docker ps -s"
alias dpsa="docker ps -as"
alias dsp="docker system prune --all"
alias dre="docker restart"
alias dat="docker attach"
alias dstop="docker stop"
alias dvls="docker volume ls"
alias drmi="docker rmi"
alias lzdr='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /dotfiles/config:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
alias lzd='lazydocker'

# Plugins
alias fd=fdfind

# My stuff
alias ntu='cd /mnt/c/Users/zhao/Desktop/ntu'
alias projects='cd /mnt/c/Users/zhao/projects'

alias chksum='md5sum --ignore-missing --quiet -c' # check md5 hash
