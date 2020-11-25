#!/usr/bin/bash

mediaStatus=$(playerctl --player=playerctld metadata 2>&1)

if [[ "$mediaStatus" == "No player could handle this command" ]]; then
	echo "No Player Found"
else
	echo "$(playerctl --player=playerctld metadata --format '{{ artist }} - {{ title }} | {{ uc(status) }}')"
fi
