#!/bin/sh

STATUS_FILE=~/.config/deadd/status

if [[ ! -f $STATUS_FILE ]]; then
    echo 1 >$STATUS_FILE
fi

status=$(cat $STATUS_FILE)

if [[ $status == 1 ]]; then
    # unpause popup notifications
    notify-send.py a --hint \
        boolean:deadd-notification-center:true \
        string:type:unpausePopups \
        &>/dev/null

    # Set status to on
    status_icon=" on"
elif [[ $status == 0 ]]; then
    # pause popup notifications
    notify-send.py a --hint \
        boolean:deadd-notification-center:true \
        string:type:pausePopups \
        &>/dev/null

    # Set status to off
    status_icon=" off"
fi

echo $status_icon
