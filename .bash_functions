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
  du -h --max-depth="$depth" "$1" 2> /dev/null | sort -hr
}

mcd() {
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

copy(){
  cat "$1" | nvim -c 'normal ggVG"+yZQ' --headless - 
}

# Docker
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

drea(){
   docker restart "$1"
   docker attach "$1"
}

dsrm(){
   docker stop "$1"
   docker rm "$1"
}

dcp(){
  docker compose --profile "$1" up -d
}

dcpd(){
  docker compose --profile "$1" down
}

lg(){
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

  lazygit "$@"

  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
          cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
          rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  fi
}

# turn this into git alias someday
fatfiles(){
  git rev-list --all --objects | \
  sed -n $(git rev-list --objects --all | \
  cut -f1 -d' ' | \
  git cat-file --batch-check | \
  grep blob | \
  sort -n -k 3 | \
  tail -n40 | \
  while read hash type size; do 
       echo -n "-e s/$hash/$size/p ";
  done) | \
  sort -n -k1
}

eradicate(){
  git filter-branch -f  --index-filter "git rm --force --cached --ignore-unmatch '$1'" -- --all
  rm -Rf .git/refs/original && \
  rm -Rf .git/logs/ && \
  git reflog expire --expire=now --all && \
  git gc --aggressive && \
  git prune && \
  
  git count-objects -v
}

function ssh() {
  # tmux起動時
  if [[ -n $(printenv TMUX) ]] ; then
    # 現在のペインIDを記録
    local pane_id=$(tmux display -p '#{pane_id}')
    # 接続先ホスト名に応じて背景色を切り替え
    # https://www.ditig.com/256-colors-cheat-sheet
    if [[ `echo $1 | grep 'digitalocean'` ]] ; then
        tmux select-pane -P 'bg=colour17,fg=white'
    elif [[ `echo $1 | grep 'otherssh'` ]] ; then
        tmux select-pane -P 'bg=colour25,fg=white'
    fi

    # 通常通りssh続行
    command ssh $@

    # デフォルトの背景色に戻す
    tmux select-pane -t $pane_id -P 'default'
  else
    command ssh $@
  fi
}
