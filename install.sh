sudo su
sudo apt-get 

cd ~
sudo apt install curl git

curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage -o nvim
chmod u+x nvim

sudo git clone https://github.com/Agentzhao/dotfiles.git temp
sudo mv ~/temp/.zhao_profile ~/
sudo mv -v ~/temp/* ~/.config
sudo rm -rf temp
sudo chown -R $USER .config

export PATH=$PATH:$(pwd):$(pwd)/.config/shell

sudo apt-get -u upgrade