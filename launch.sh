#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

rm /tmp/polybar.pids

polybar -c ~/.config/polybar/config.ini mybar &
echo "$!" >>/tmp/polybar.pids
