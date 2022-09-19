#!/bin/bash

languages=`echo "c cpp java python javascript typescript nodejs" | tr ' ' '\n'`
coreutils=`echo "xargs chmod curl wget" | tr ' ' '\n'`

selected=`printf "$languages\n$coreutils" | fzf`
if [[ -z "$selected" ]]; then
  exit 0
fi

read -p "Query: " query

# if printf "$languages" | grep -qs "$selected"; then
  # tmux neww curl cht.sh/$selected/`echo query | tr ' ' '+'` & while [ : ]; do sleep 1; done
# elif printf "$coreutils" | grep -qs "$selected"; then
#   curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done
# fi

if `printf $languages` | grep -qs "$selected"; then
  query=`echo $query | tr ' ' '+'`
  # tmux neww bash -c "curl -s cht.sh/$selected/$query | bat & while [ : ]; do sleep 1; done"
  tmux neww bash -c "curl -s cht.sh/$selected/$query | bat" 
else
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
