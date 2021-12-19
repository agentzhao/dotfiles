# nvim

`curl -L https://github.com/neovim/neovim/releases/download/v0.5.1/nvim.appimage -o nvim.`

`chmod u+x nvim.appimage`

//install nodejs

//edit nvim config file

`exe 'edit '.stdpath('config').'/init.vim'`
    
//download config files
`gh repo clone Agentzhao/nvim`

//download and install vim plug

`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

`iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force`
