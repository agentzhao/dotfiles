#!/bin/bash
# --rm - container is removed when it exits
EXISTING=$(docker container ls -a | grep agentzhao/arch-linux:latest | awk '{ print $1}')
if [[ $EXISTING ]]; then
  docker restart $EXISTING
  docker attach "$EXISTING"
else
  EXISTING=$(docker run -d -it --rm \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v ~/:/home/"$USER" \
      -e HOME="/home/$USER" \
      --network host \
      --name arch-linux-tmux-stable \
      agentzhao/arch-linux:latest \
      tmux)
  docker attach "$EXISTING"
fi

