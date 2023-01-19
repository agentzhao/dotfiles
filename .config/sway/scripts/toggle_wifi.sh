#!/bin/sh

if [ $(nmcli radio wifi | awk '/led/ {print}') = 'enabled'  ] ; then
  nmcli radio wifi off
  notify-send "Wifi" "Wifi is now disabled"
else
  nmcli radio wifi on
  notify-send "Wifi" "Wifi is now enabled"
fi
