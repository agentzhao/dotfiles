cd ~
sudo apt install git

# nvim
curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage -o nvim
chmod u+x nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# config files
git clone https://github.com/Agentzhao/dotfiles.git temp
mv ~/temp/.bash_profile ~/
mv -v ~/temp/* ~/.config
rm -rf temp
chown -R $USER .config
echo "source ~/.bash_profile" >> .bashrc

# hack font
curl -L -O https://raw.githubusercontent.com/source-foundry/hack-linux-installer/master/hack-linux-installer.sh
chmod +x hack-linux-installer.sh
sudo mkdir ~/.local/share/fonts/
./hack-linux-installer.sh latest
rm ./hack-linux-installer.sh

rm /.config/install.sh
rm ./install.sh
