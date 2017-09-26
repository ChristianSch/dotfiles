#!/usr/bin/env bash

[[ "$1" == "up" ]] && amixer set Master 5%+
[[ "$1" == "down" ]] && amixer set Master 5%-
[[ "$1" == "mute" ]] && amixer sset Master toggle

FRONT_LEFT=$(amixer get Master | grep -E '^\s+Front Left')
MONO=$(amixer get Master | grep -E '^\s+Mono')

if [[ $FRONT_LEFT == "" ]]; then
	VOL_INFO=$MONO
else
	VOL_INFO=$FRONT_LEFT
fi

if [[ $VOL_INFO == *off* ]]; then
	volnoti-show -m
else
	VOL=$(echo $VOL_INFO | grep -o -P '\d+%')
	volnoti-show $VOL
fi

exit 0
