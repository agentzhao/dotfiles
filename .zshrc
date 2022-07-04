# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

OS=`uname -s`
DIST=`lsb_release -sd`
# DIST=cat /etc/*-release | grep "Distributor ID:" | sed 's/Distributor ID://g' | sed 's/"//g'

plugins=(alias-finder
          asdf
          autoenv
          dotenv
          git
          ripgrep
          zsh-autosuggestions
          zsh-completions
          zsh-syntax-highlighting
          )

export ZSH="/home/zhao/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme
# source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
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

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

