# dotfiles

# nvim
```
curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage -o nvim
chmod u+x nvim
    
gh repo clone Agentzhao/dotfiles/nvim

//vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

# Hack font
```
curl -L -O https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.tar.gz
tar -xzvf Hack-v3.003-ttf.tar.gz
```

# Brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Shell
```
source ~/.bash_aliases
source ~/.bash_functions
```

# Powershell
```
copy to $profile
C:\Users\zhao\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```
