#!/bin/bash
term=${1:-/usr/bin/kitty}

set -m

#Run slurp and get the position and area
mapfile -d " " -t slurp_output <<< "$(slurp -f "%w %h %x %y ")"

#Start terminal
"$(which "${term}")" &

#Get terminal pid
terminal_job_id=$(jobs -pr)

#Wait for the window is created
i=0
while [ $i -lt 50 ]
do
    if (swaymsg -t get_tree --raw|grep -q "\"pid\": ${terminal_job_id},")
    then
        break
    fi
    (( i++ ))
    sleep 0.1
done

swaymsg "[pid=${terminal_job_id}] floating enable, resize set width ${slurp_output[0]} px height ${slurp_output[1]} px, move position ${slurp_output[2]} px ${slurp_output[3]} px"

fg %1
