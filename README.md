# dotfiles
```
curl https://raw.githubusercontent.com/Agentzhao/dotfiles/main/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

# nvim
```
//vim plug linux
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
//windows
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

# Brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Powershell
```
copy to $profile
C:\Users\zhao\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```
