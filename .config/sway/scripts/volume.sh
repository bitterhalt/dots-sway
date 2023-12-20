#!/bin/bash

set -euo pipefail

case "${1:-}" in
    up)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle 
        ;;
esac

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | cut -s -d/ -f2 | tr -d " %")
volume="${vol}%"
is_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -n "s/Mute: //p")

if [ "${is_muted}" = "yes" ]; then
    volume="Muted "
    icon=""
elif (( vol == 0 )); then
    icon="󰝟"
elif (( vol <= 35 )); then
    icon=""
else
    icon=""
fi

notify-send \
    -a vol_notify \
    "${icon} ${volume}" \
    -h string:x-dunst-stack-tag:volume
