#!/bin/bash

BEMENU_ARGS=(-i --hp 10 --fn "Jetbrains Mono 13" --fb "#14161B" --ff "#abb2bf" --nb "#14161B" --nf "#abb2bf" --tb "#14161B" --hb "#14161B" --tf "#bf68d9" --hf "#bf68d9" --nf "#abb2bf" --af "#abb2bf" --ab "#14161B" -H 30"$@")



if [ "$1" = 'dmenu' ]; then
  bemenu-run "${BEMENU_ARGS[@]}"
else
  bemenu "${BEMENU_ARGS[@]}"
fi
