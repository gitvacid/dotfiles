#!/bin/sh
cp -r ~/.config/foot ~/dotfiles/.config/
cp -r ~/.config/fastfetch ~/dotfiles/.config/
cp -r ~/.config/mako ~/dotfiles/.config/
cp -r ~/.config/nvim ~/dotfiles/.config/
cp -r ~/.config/rofi ~/dotfiles/.config/
cp -r ~/.config/sway ~/dotfiles/.config/
cp -r ~/.config/waybar ~/dotfiles/.config/
cp -r ~/.config/gammastep/ ~/dotfiles/.config/
cp ~/.bashrc ~/dotfiles/
cp ~/scripts/updatedots.sh ~/dotfiles/scripts/
cp ~/scripts/blur-lock.sh ~/dotfiles/scripts/
cd ~/dotfiles
git add --all
git commit
git push
cd -
