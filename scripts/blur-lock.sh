#!/bin/sh
PICTURE="/tmp/blurlock.png"

grim "$PICTURE"
magick $PICTURE -blur 5x4 $PICTURE
swaylock -i $PICTURE
shred $PICTURE
rm $PICTURE
