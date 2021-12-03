# dotfiles
```
cd ~
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
