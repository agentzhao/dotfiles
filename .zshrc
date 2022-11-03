# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

OS=`uname -s`
# DIST=`lsb_release -sd`
# DIST=cat /etc/*-release | grep "Distributor ID:" | sed 's/Distributor ID://g' | sed 's/"//g'
DIST=$(grep 'PRETTY_NAME=' /etc/*-release)

plugins=(alias-finder
          asdf
          autoenv
          docker
          dotenv
          git
          ripgrep
          zsh-autosuggestions
          zsh-completions
          zsh-syntax-highlighting
          )

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export ZSH="/home/zhao/.oh-my-zsh"
elif [[ "$OSTYPE" == "linux-android" ]]; then
  export ZSH="/data/data/com.termux/files/home/.oh-my-zsh"
fi

# change theme when ssh
if [[ -n "$SSH_CONNECTION" ]]; then
  # ZSH_THEME="agnoster"
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
  # other settings
  . "$HOME/.cargo/env"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # brew
  eval "$(bw completion --shell zsh); compdef _bw bw;" # bitwarden zsh-completions
fi
# source ~/powerlevel10k/powerlevel10k.zsh-theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme # arch linux

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.bash_profile

eval "$(zoxide init zsh --cmd j)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Starting Tailscale daemon automatically if not running...
# RUNNING=`ps aux | grep tailscaled | grep -v grep`
# if [ -z "$RUNNING" ]; then
#     sudo tailscaled > /dev/null 2>&1 &
#     disown
# fi

# start tmux && [[ -n "$SSH_CONNECTION" ]]
if [[ -z "$TMUX" ]] && [[ -n $SSH_TTY ]]; then
  tmux new-session -A -s zhao
fi
