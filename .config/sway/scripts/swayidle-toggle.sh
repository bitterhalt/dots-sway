#!/usr/bin/env bash
# Simple sript to toggle swayidle
status() {
    if pgrep swayidle >/dev/null; then
        echo ""
    else
        echo ""
    fi
}


toggle() {
if  pgrep swayidle >/dev/null; then
    pkill swayidle
    notify-send -a idle_notify " Swayidle disabled" -h string:x-dunst-stack-tag:volume
else
    notify-send -a idle_notify " Swayidle enabled" -h string:x-dunst-stack-tag:volume
    swayidle -w \
    timeout 1800 'swaylock -f -C ~/.config/swaylock/config' \
    timeout 3600 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
    before-sleep 'swaylock -f -C ~/.config/swaylock/config' &
fi
 pkill -RTMIN+8 waybar
}


case "$1" in
    "status")
        status
        ;;
    "toggle")
        toggle
        ;;
    *)
        echo "Invalid argument"
        exit 1
        ;;
esac
