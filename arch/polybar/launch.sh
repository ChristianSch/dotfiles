#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# starts a polybar instance on all monitors

IFS='
'
set -o noglob

displays=($(xrandr | grep " connected" | awk -F'[ +]' '{print $1}'))

for display in "${displays[@]}"
do
    echo "starting polybar 'main_bar' on env MONITOR="$display
    env MONITOR=$display polybar top &
    env MONITOR=$display polybar bottom &
done

# Launch bar1 and bar2

echo "Bars launched..."
