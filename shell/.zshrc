# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/zhao/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(alias-finder
          asdf
          autoenv
          autojump
          dotenv
          git
          ripgrep
          zsh-autosuggestions
          zsh-completions
          zsh-syntax-highlighting
          )

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

source ~/powerlevel10k/powerlevel10k.zsh-theme

source ~/.bash_profile

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/autojump/autojump.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
