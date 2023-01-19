#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# edit style at ~/.config/wofi/style.css
# icons uses Nerd Font
# https://www.nerdfonts.com/cheat-sheet
import os


def run_menu():
    keys = (
        "\uf023   Log Out",
        "\uf9b1   Sleep",
        "\uf186   Suspend",
        "\uf2dc   Hibernate",
        "\uf021   Reboot",
        "\uf011   Shutdown",
    )

    actions = (
        "swaymsg exit",
        "killall -SIGUSR1 swayidle",
        "systemctl suspend",
        "systemctl hibernate",
        "systemctl reboot",
        "systemctl poweroff",
    )

    options = "\n".join(keys)
    choice = (
        os.popen(
            "echo -e '"
            + options
            + "' | wofi -d -i -p 'Power Menu' -W 200 -H 280 -k /dev/null"
        )
        .readline()
        .strip()
    )
    if choice in keys:
        os.popen(actions[keys.index(choice)])


run_menu()
