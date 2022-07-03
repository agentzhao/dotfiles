# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/zhao/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"

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

autoload -U compinit && compinit

source ~/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.bash_profile

source /usr/share/autojump/autojump.zsh
eval "$(zoxide init zsh --cmd j)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
