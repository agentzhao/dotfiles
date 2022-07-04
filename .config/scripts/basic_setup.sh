cd ~

# packages
sudo apt-get update && apt-get install git zsh xclip -y

# node js
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Neovim
sudo curl -L https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage -o /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# hack font
curl -L -O https://raw.githubusercontent.com/source-foundry/hack-linux-installer/master/hack-linux-installer.sh
chmod +x hack-linux-installer.sh
sudo mkdir ~/.local/share/fonts/
./hack-linux-installer.sh latest
rm ./hack-linux-installer.sh
fc-cache -f -v

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
