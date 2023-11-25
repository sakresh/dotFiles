#!/bin/sh

slstatus &
nitrogen --restore &
~/.local/bin/remaps &
picom &
exec dwm
