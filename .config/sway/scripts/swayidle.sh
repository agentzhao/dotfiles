#!/bin/sh

swayidle \
  timeout 1 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' &
swaylock -c 000000
kill %%
