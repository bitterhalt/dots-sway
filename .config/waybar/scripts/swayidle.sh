#!/usr/bin/env bash

if pgrep -x "swayidle" > /dev/null; then
    echo "{\"text\": \"󰒳\", \"tooltip\": \"<b>Swayidle:</b> active\"}"
else
    echo ""
fi
