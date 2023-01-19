swayidle -w \
         timeout 0 'swaylock -f -c 000000' \
         timeout 0 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
         before-sleep 'swaylock -f -c 000000'

