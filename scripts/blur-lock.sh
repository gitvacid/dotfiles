#!/bin/sh
PICTURE="/tmp/blurlock.png"

grim "$PICTURE"
magick $PICTURE -blur 0x5 $PICTURE
swaylock -i $PICTURE \
	--font "Iosevka Nerd Font" \
	--indicator-radius 100 \
	--ring-color aeaed1 \
	--key-hl-color 7fa563 \
	--bs-hl-color d8647e \
	--inside-color 141415 \
	--inside-clear-color 141415 \
	--ring-clear-color cdcdcd \
	--inside-ver-color 141415 \
	--ring-ver-color 7e98e8 \
	--inside-wrong-color 141415 \
	--ring-wrong-color d8647e \
	--text-color cdcdcd \
	--text-clear-color cdcdcd \
	--text-ver-color cdcdcd \
	--text-wrong-color cdcdcd \
	--text-caps-lock-color e0a363

shred $PICTURE
rm $PICTURE
