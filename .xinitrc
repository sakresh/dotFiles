#!/bin/sh

dunst &

slstatus &

nitrogen --restore &

setxkbmap -option caps:escape &

~/.local/bin/remaps &

picom &

exec dwm
