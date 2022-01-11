# Functions
allfunctions(){
  bat ~/.config/shell/.bash_functions
}

# Sync dotfiles
stowsync() {
  cd ~/dotfiles
  stow -nvt ~ */
  echo "Are you sure you want to sync dotfiles? [y/n]"
  read input
  if [ "$input" == "y" ]; then
    stow -vt ~ */
  else
    echo "Abouting..."
  fi
}

# C/C++ compile and run
cpprun() {
  g++ -o "$1" "$1.cpp"
  echo "Compiled! Enter input:"
  ./"$1"
}

crun() {
  gcc -o "$1" "$1.c"
  echo "Compiled! Enter input:"
  ./"$1"
}

# size of dir/file
sizeof() {
  depth=${2:-0}
  du -h --max-depth=$depth $1
}

mkdircd() {
  mkdir -v -p $1
  cd $1
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
