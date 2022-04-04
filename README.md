# dotfiles

```
cd ~
sudo apt update
sudo apt install -y git stow
git clone https://github.com/agentzhao/dotfiles.git
cd ~/dotfiles
stow -vt ~ */

curl https://raw.githubusercontent.com/agentzhao/dotfiles/main/scripts/basic_setup.sh -o basic_setup.sh
chmod +x basic_setup.sh
./basic_setup.sh
chsh -s $(which zsh)
rm basic_setup.sh
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

# zsh tools

```
https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
```

# wsl2 backup and import

```
wsl --export Ubuntu-20.04 ubuntubackup.tar
wsl --import Ubuntu-20.04 C:\Users\MyPC\AppData\Local\Packages\Ubuntu C:\Users\MyPC\Documents\ubuntubackup.tar
```

# Target packages ... is configured multiple times

```
https://askubuntu.com/questions/760896/how-can-i-fix-apt-error-w-target-packages-is-configured-multiple-times
```
