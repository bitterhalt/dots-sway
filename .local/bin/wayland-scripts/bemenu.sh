#!/bin/bash

# forked from: https://github.com/Madic-/Sway-DE/blob/master/bin/bemenu-run.sh

# Theme
BG="#14161B"
FG="#abb2bf"
BG2="#282C34"
PURPLE="#bf68d9"

BEMENU_ARGS=(-i --hp 10 --fn "Jetbrains Mono 13" --fb "$BG" --ff "$FG" --nb "$BG" --nf "$FG" --tb "$BG" --hb "$BG2" --tf "$PURPLE" --hf "$PURPLE" --nf "$FG" --af "$FG" --ab "$BG" -H 30"$@")

if [ "$1" = 'dmenu' ]; then
  bemenu-run "${BEMENU_ARGS[@]}"
else
  bemenu "${BEMENU_ARGS[@]}"
fi
