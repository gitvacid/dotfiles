#!/bin/sh
PLAYER_STATUS=$(playerctl -s status)
ARTIST=$(playerctl metadata -f '{{markup_escape(artist)}}')
TITLE=$(playerctl metadata -f '{{markup_escape(title)}}')

if [[ $PLAYER_STATUS == "Paused" ]]; then
	 # echo "{\"text\": \"󰐊 $ARTIST - $TITLE\"}"
	echo "󰐊 $ARTIST - $TITLE"
elif [[ $PLAYER_STATUS == "Playing" ]]; then
	# echo "{\"text\": \"󰏤 $ARTIST - $TITLE\"}"
	echo "󰏤 $ARTIST - $TITLE"
fi
