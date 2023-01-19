export PATH=$PATH:$(pwd):~/.local/bin:/usr/local/go/bin:~/.cargo/bin:/usr/lib/dart/bin:~/development/flutter/bin:~/nvim-linux64/bin:/mnt/c/tools/neovim/Neovim:/mnt/c/tools/neovim/Neovim/bin:/mnt/c/Windows/system32:~/bin
# export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g') # strip out problematic Windows %PATH%
export TESSDATA_PREFIX='/usr/local/share/tessdata'
export GOPATH="$HOME/go"

# sway
if [[ -n "$SWAYSOCK" ]] then
  export XDG_CURRENT_DESKTOP=sway
fi

source ~/.bash_aliases
source ~/.bash_functions
