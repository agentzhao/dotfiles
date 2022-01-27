# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zhao/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/zhao/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/zhao/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/zhao/.fzf/shell/key-bindings.bash"
