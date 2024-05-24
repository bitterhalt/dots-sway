#!/usr/bin/env bash

if pgrep -x "swayidle" > /dev/null; then
    echo ""
else
    echo "{\"text\": \"󰒳\", \"tooltip\": \"<b>Swayidle:</b> disabled\"}"
fi
