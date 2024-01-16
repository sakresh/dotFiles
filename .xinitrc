#!/bin/sh

dunst &

slstatus &

nitrogen --restore &

~/.local/bin/remaps &

picom &

exec dwm
