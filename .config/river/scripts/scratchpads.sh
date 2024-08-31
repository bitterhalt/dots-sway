#!/bin/bash
#
# Riverctl script to open scratchpads, and open programs if Scratchpads are
# empty. Usage "./scratchpads.sh <term|lf|nvim>"
#

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Error: No argument provided."
    exit 1
fi
term="foot"
term="$term --app-id special-term"
lf="$term --app-id special-lf -e lf"
nvim="$term --app-id special-nvim -e nvim"
keepassxc="riverctl spawn keepassxc"

terminal_tag=$((1 << 11))
lf_tag=$((1 << 12))
editor_tag=$((1 << 13))
secrets_tag=$((1 << 14))
case "$1" in
    "term")
        search="special-term"
        tag="$terminal_tag"
        cmd="$term"
        ;;
    "lf")
        search="special-lf"
        tag="$lf_tag"
        cmd="$lf"
        ;;
    "nvim")
        search="special-nvim"
        tag="$editor_tag"
        cmd="$nvim"
        ;;
    "keepassxc")
        search="keepassxc"
        tag="$secrets_tag"
        cmd="$keepassxc"
        ;;
esac

if lswt | grep -q "$search"; then
    riverctl set-focused-tags "$tag"
else
    riverctl spawn "$cmd"
    riverctl set-focused-tags "$tag"
fi
