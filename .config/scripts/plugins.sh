cd ~
# the fuck
sudo apt install python3-dev python3-pip python3-setuptools -y
pip3 install thefuck --user

# autojump
sudo apt install autojump -y
echo "source /usr/share/autojump/autojump.zsh" >> ~/.zshrc && source ~/.zshrc
sudo chmod 755 /usr/share/autojump/autojump.bash

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# auto env
git clone git://github.com/inishchith/autoenv.git ~/.autoenv

# bat
curl -L https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_amd64.deb -o bat_0.18.3_amd64.deb
sudo dpkg -i bat_0.18.3_amd64.deb 
sudo rm bat_0.18.3_amd64.deb 

# ripgrep
RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/latest/download/ripgrep_${RIPGREP_VERSION}_amd64.deb"
sudo apt install -y ./ripgrep.deb
rm -rf ripgrep.deb
rg --version

# fd
sudo apt install fd-find
ln -s $(which fdfind)

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
