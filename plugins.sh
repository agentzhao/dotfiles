# the fuck
sudo apt update
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
echo 'source ~/.autoenv/activate.sh' >> ~/.bashrc

# bat
sudo dpkg -i bat_0.18.3_amd64.deb  # adapt version number and architecture
