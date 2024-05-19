#!/bin/sh

# Line "-a fat_notify" is not needed if you are not using Mako

set -e

cpu () {
    notify-send -a fat_notify "CPU usage" "$(ps axch -o cmd,%cpu --sort=-%cpu | head)"
}

ram () {
    notify-send -a fat_notify "RAM usage" "$(ps axch -o cmd,rss | awk '{printf "%-30s %s\n", $1, $2/1024}'| sort -k2 -n -r | head | awk '{printf "%-30s %s\n", $1, $2}')"
}

case "$1" in
    "cpu")
        cpu
        ;;
    "ram")
        ram
        ;;
    *)
        echo "Invalid argument"
        exit 1
        ;;
esac
