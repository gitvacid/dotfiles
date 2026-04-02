#!/bin/sh
status=$(playerctl -s status)
artist=$(playerctl metadata -f '{{markup_escape(artist)}}')
title=$(playerctl metadata -f '{{markup_escape(title)}}')

if [[ $status == "Paused" ]]; then
	echo "󰐊 $artist - $title"
	
elif [[ $status == "Playing" ]]; then
	echo "󰏤 $artist - $title"
fi
