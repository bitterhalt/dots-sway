#!/usr/bin/env bash

if pgrep swayidle >/dev/null; then
  pkill swayidle
  notify-send -a center_notify "Swayidle" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  notify-send -a center_notify "Swayidle" "Enabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  swayidle -w \
    timeout 1800 'swaylock -f -C ~/.config/swaylock/config' \
    timeout 3600 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' \
    before-sleep 'swaylock -f -C ~/.config/swaylock/config' &
fi
