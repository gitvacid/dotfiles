#!/bin/sh
confirm_exit=$(echo -e "Yes\nNo" | rofi \
	-theme-str 'window {location: center; fullscreen: false; padding: 10px; width: 300px;}' \
	-theme-str 'mainbox {children: [ "message", "listview" ];}' \
	-theme-str 'message {border: 0;}' \
	-theme-str 'listview {scrollbar: false; lines: 1; columns: 2;}' \
	-theme-str 'element-text {horizontal-align: 0.5;}' \
	-theme-str 'textbox {horizontal-align: 0.5;}' \
	-dmenu \
	-mesg 'Do you want to exit sway?')

if [[ "$confirm_exit" == "Yes" ]]; then
	swaymsg exit
else
	exit 0
fi
