# the fuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools -y
pip3 install thefuck --user

# autojump
sudo apt install autojump -y
echo "source /usr/share/autojump/autojump.zsh" >> ~/.zshrc && source ~/.zshrc
sudo chmod 755 /usr/share/autojump/autojump.bash
