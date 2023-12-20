#/bin/bash
set -euo pipefail

status() {
    if pactl get-source-mute @DEFAULT_SOURCE@ | grep -Po '(?<=Mute: )(yes|no)'; then
        echo ""
    else
        echo ""
    fi
}

toggle () {
pactl set-source-mute @DEFAULT_SOURCE@ toggle

if pactl list sources | grep -q "Mute: yes"; then
    notify-send -a vol_notify "  off"
else
    notify-send -a vol_notify  " on"
fi
}


case "$1" in
    "toggle")
        toggle
        ;;
    "status")
        status
        ;;
    *)
        echo "Invalid argument"
        exit 1
        ;;
esac
