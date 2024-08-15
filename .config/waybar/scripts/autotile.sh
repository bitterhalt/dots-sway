#!/usr/bin/env bash

if pgrep "autotiling" > /dev/null; then
    echo "{\"text\": \"[]=\", \"tooltip\": \"<b>Autotiling</b> is enabled\"}"
else
    echo ""
fi
