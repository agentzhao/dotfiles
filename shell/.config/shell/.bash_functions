# Functions

# C/C++ compile and run
cpprun() {
    echo "Compiling file..."
    g++ -o "$1" "$1.cpp"
    echo "Compiled! Enter input:"
    ./"$1"
}

crun() {
    echo "Compiling file..."
    gcc -o "$1" "$1.c"
    echo "Compiled! Enter input:"
    ./"$1"
}

updatenvimconfig(){
    cd ~
    git clone https://github.com/Agentzhao/dotfiles.git temp
    rm -rf ~/.config/nvim/*
    mv -v ~/temp/nvim/* ~/.config/nvim
    rm -rf ~/temp
}
