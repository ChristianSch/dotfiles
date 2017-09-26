#!/bin/bash

[[ "$1" == "up" ]] && xbacklight -inc 5
[[ "$1" == "down" ]] && xbacklight -dec 5

if [[ "$1" ]]; then
    volnoti-show -s /usr/share/pixmaps/volnoti/display-brightness-symbolic.svg $(xbacklight)
fi
