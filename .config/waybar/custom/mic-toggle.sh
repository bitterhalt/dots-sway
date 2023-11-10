#/bin/bash


status() {
    if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
        echo ""
    else
        echo ""
    fi
}

toggle () {
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
    notify-send -a tiny_notify "  off"
else
    notify-send -a tiny_notify  " on"
fi
pkill -RTMIN+6 waybar
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
