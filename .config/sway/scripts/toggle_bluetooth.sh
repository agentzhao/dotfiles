#!/bin/bash

if rfkill list bluetooth | grep -q 'yes$' ; then 
    rfkill unblock bluetooth
    notify-send "Bluetooth" "Bluetooth is now enabled"
else
    rfkill block bluetooth
    notify-send "Bluetooth" "Bluetooth is now disabled"
fi
