cd ~

# packages
sudo apt-get update && apt-get install git zsh xclip -y

# node js
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# nvim
sudo curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage -o /usr/local/bin/nvim
chmod u+x /usr/local/bin/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

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
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# config files
git clone https://github.com/Agentzhao/dotfiles.git temp
mv -v ~/temp/* ~/.config
rm -rf temp
chown -R $USER .config
mv ~/.config/.bash_profile ~/
echo "source ~/.bash_profile" >> .zshrc

# clean up
