#!/bin/sh
location=~/dotfiles/wallpapers/
wall=$(fd . $location | fzf)
echo "output * bg $wall fill" | tee ~/.config/sway/wallpaper
swaymsg reload
