#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
MONITOR=DP-0 polybar example &
MONITOR=DP-5 polybar example &
MONITOR=DP-7 polybar example &


echo "Bars launched..."
