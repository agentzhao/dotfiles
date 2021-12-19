#!/usr/bin/env bash
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

# Plugins
alias fd=fdfind

# My stuff
alias ntu='cd /mnt/c/Users/zhao/Desktop/ntu'
alias projects='cd /mnt/c/Users/zhao/projects'

alias chksum='md5sum --ignore-missing --quiet -c' # check md5 hash