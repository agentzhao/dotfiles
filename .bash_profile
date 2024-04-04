export PATH=$PATH:$(pwd):~/.local/bin:/usr/local/go/bin:~/.cargo/bin:/usr/lib/dart/bin:~/nvim-linux64/bin:/mnt/c/tools/neovim/Neovim:/mnt/c/tools/neovim/Neovim/bin:/mnt/c/Windows/system32:~/bin:~/snap/flutter/common/flutter:~/development/flutter/bin:~/.pub-cache/bin:/opt/mssql-tools/bin:~/.pyenv/bin:/usr/local/bin/node

# export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g') # strip out problematic Windows %PATH%
export TESSDATA_PREFIX='/usr/local/share/tessdata'
export GOPATH="$HOME/go"

# sway
if [[ -n "$SWAYSOCK" ]] then
  export XDG_CURRENT_DESKTOP=sway
fi

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu

export TERM=xterm-256color

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

source /usr/local/lib/node_modules/@hyperupcall/autoenv/activate.sh # autoenv
source ~/.bash_aliases
source ~/.bash_functions
