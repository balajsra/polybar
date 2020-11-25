#!/bin/bash

BAR="mybar"
CONFIG="~/.config/polybar/config.ini"
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)
TRAY_POS="right"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

rm /tmp/polybar.pids
sleep 1

# Launch on primary monitor
MONITOR=$PRIMARY TRAY_POS=$TRAY_POS polybar --reload -c $CONFIG $BAR &
sleep 1

# Launch on all other monitors
for m in $OTHERS; do
    MONITOR=$m TRAY_POS=none polybar --reload -c $CONFIG $BAR &
done

echo "$!" >>/tmp/polybar.pids
