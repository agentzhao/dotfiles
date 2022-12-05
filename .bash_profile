export PATH=$PATH:$(pwd):~/.local/bin:/usr/local/go/bin:~/.cargo/bin:/usr/lib/dart/bin:~/development/flutter/bin:~/nvim-linux64/bin:/mnt/c/tools/neovim/Neovim:/mnt/c/tools/neovim/Neovim/bin:/mnt/c/Windows/system32:~/bin
# export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g') # strip out problematic Windows %PATH%
export TESSDATA_PREFIX='/usr/local/share/tessdata'

# VcXsrv
# `ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
export DISPLAY="172.21.192.221:0"

source .bash_aliases
source .bash_functions
