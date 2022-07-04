export PATH=$PATH:$(pwd):~/.local/bin:/usr/local/go/bin:~/.cargo/bin:/usr/lib/dart/bin:/flutter/bin:~/nvim-linux64/bin:/mnt/c/tools/neovim/Neovim:/mnt/c/tools/neovim/Neovim/bin
export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g') # strip out problematic Windows %PATH%
export TESSDATA_PREFIX='/usr/local/share/tessdata'

source .bash_aliases
source .bash_functions
. "$HOME/.cargo/env"
