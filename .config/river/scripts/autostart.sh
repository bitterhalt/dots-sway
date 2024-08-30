#!/bin/bash

# Does not work since my display prefer 60Hz after sleep so I use kanshi instead
# wlr-randr --output 'DP-1' --mode 2560x1440@74.968002Hz

foot -s &
pipewire &

pkill -f kanshi
kanshi &

pkill -f swayidle
swayidle -w \
         timeout 1800 "swaylock -f" \
         timeout 3600 "wlopm --off '*'" resume "wlopm --on '*'" \
         before-sleep "swaylock -f" &

pkill -f waybar
waybar &


pkill -f swaybg
swaybg -m fill -i ~/.local/share/wall/bg &

pkill wl-paste
wl-paste --watch cliphist -max-items 100 store &
