#!/bin/bash

# Functions
allfunctions(){
  bat ~/.config/shell/.bash_functions
}

# Sync dotfiles
stowsync() {
  cd ~/dotfiles
  stow -nvt ~ */
  echo "Are you sure you want to sync dotfiles? [y/n]"
  read -r input
  if [ "$input" == "y" ]; then
    stow -vt ~ */
  else
    echo "Aborting..."
  fi
}

# C/C++ compile and run
cpprun() {
  g++ -o "$1" "$1.cpp"
  echo "Compiled! Enter input:"
  if [ -z "$2" ]
  then
    time ./"$1"
  else
    time ./"$1" < "$2"
  fi
}

crun() {
  gcc -o "$1" "$1.c"
  echo "Compiled! Enter input:"
  if [ -z "$2" ]
  then
    time ./"$1"
  else
    time ./"$1" < "$2"
  fi
}

# size of dir/file
sizeof() {
  depth=${2:-0}
  du -h --max-depth="$depth" "$1"
}

mkdircd() {
  mkdir -v -p "$1"
  cd "$1"
}

gitcreate(){
  if [ -d .git ]; then
    git init
    git add README.md
    git commit -m "first"
    git branch -M main
    git remote add origin "https://github.com/agentzhao/$1.git"
    git push -u origin main
  else
    echo "Not a git repo. Create one first."
    echo "gh repo create name --public --gitignore"
  fi;
}

tess(){
  tesseract "$1" stdout | clip.exe
}

getpubkey(){
  # cat ~/.ssh/id_rsa.pub | clip.exe
  clip.exe < ~/.ssh/id_rsa.pub
}

copy(){
  cat "$1" | nvim -c 'normal ggVG"+yZQ' --headless - 
}
