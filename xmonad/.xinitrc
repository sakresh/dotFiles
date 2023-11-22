#!/bin/sh

picom &

nitrogen --restore &

xsetroot -cursor_name left_ptr &

exec xmonad
