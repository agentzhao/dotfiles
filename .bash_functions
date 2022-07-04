#!/bin/bash

# Functions
allfunctions(){
  bat ~/.bash_functions
}

# Sync dotfiles
stowsync() {
  cd ~/dotfiles || exit
  stow -nvt ~ .
  echo "Are you sure you want to sync dotfiles? [y/n]"
  read -r input
  if [ "$input" == "y" ]; then
    stow -vt ~ .
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

# java files
jrun() {
  javac "$1.java"
  echo "Compiled! Enter input:"
  if [ -z "$2" ]
  then
    time java "$1"
  else
    time java "$1" < "$2"
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

# Docker
drea(){
  docker restart "$1"
  docker attach "$1"
}

# List RAM used by container
dmem() {
    if [ -f /sys/fs/cgroup/memory/docker/"$1"/memory.usage_in_bytes ]; then
        echo $(( $(cat /sys/fs/cgroup/memory/docker/"$1"/memory.usage_in_bytes) / 1024 / 1024 )) 'MB'
    else
        echo 'n/a'
    fi
}

# Return id of container given name
did() {
  ID=$( $DSUDO docker inspect --format="{{.Id}}" "$1" 2> /dev/null);
  if (( $? >= 1 )); then
      # Container doesn't exist
      ID=''
  fi
  echo $ID
}

# List all IP addresses used by container
dip() {
    IP=$($DSUDO docker inspect --format="{{.NetworkSettings.IPAddress}}" "$1" 2> /dev/null)
    if (( $? >= 1 )); then
        # Container doesn't exist
        IP='n/a'
    fi
    echo $IP
}

# List Volume used by container
dvol() {
    vols=$($DSUDO docker inspect --format="{{.HostConfig.Binds}}" "$1")
    vols=${vols:1:-1}
    for vol in $vols
    do
      echo "$vol"
    done
}

drm(){
  docker stop "$1"
  docker rm "$1"
}

dit(){
  docker exec -it "$1" /bin/sh
}
