#!/bin/bash

CONFIG=$HOME/.config/sway/config
MOD=$(sed -nre 's/^set \$mod (.*)/\1/p' ${CONFIG})
grep "^bindsym" ${CONFIG} \
    | sed "s/-\(-\w\+\)\+//g;s/\$mod/${MOD}/g;s/Mod1/Alt/g;s/exec //;s/bindsym //;s/^\s\+//;s/^\([^ ]\+\) \(.\+\)$/\2: \1/;s/^\s\+//" \
    | tr -s ' ' \
    | tofi --prompt-text "Search " \
    --background-color 000B \
    --selection-color 181B20 \
    --selection-background C678DD \
    --selection-background-corner-radius 0 \
    --selection-background-padding "2, 10" \
    --width 100% \
    --height 100% \
    --anchor center \
    --padding-left  40% \
    --padding-top  2% \
    --border-color  BF68D9 \
    --border-width 0
