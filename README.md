# dotfiles

```
cd ~
sudo apt update
sudo apt install -y git stow zsh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/hyperupcall/autoenv ~/.autoenv

git clone https://github.com/agentzhao/dotfiles.git
cd ~/dotfiles
stow -nvt ~ .
stow -vt ~ .
```

# Brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Github cli Debian, Ubuntu Linux, Raspberry Pi OS (apt)

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Powershell copy to $profile

```
C:\Users\zhao\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

# Get all saved wifi network and passwords

```
(netsh wlan show profiles) | Select-String “\:(.+)$” | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name=”$name” key=clear)} | Select-String “Key Content\W+\:(.+)$” | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize
```

# python

```
cd ~
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9 -y
sudo apt install python3-pip -y
pip3 install pynvim
```

# wsl2 backup and import

```
wsl --export Ubuntu-20.04 ubuntubackup.tar
wsl --import Ubuntu-20.04 C:\Users\MyPC\AppData\Local\Packages\Ubuntu C:\Users\MyPC\Documents\ubuntubackup.tar
```

# Target packages ... is configured multiple times

https://askubuntu.com/questions/760896/how-can-i-fix-apt-error-w-target-packages-is-configured-multiple-times

# Debugging

`docker:1: maximum nested function level reached; increase FUNCNEST?`

`unset -f docker`

# Git filter-repo

```
https://github.com/newren/git-filter-repo
git clone --mirror https://github.com/<username>/<repo>.git
git filter-repo --invert-paths --path <folder>/<file>
git push --no-verify --mirror
```
