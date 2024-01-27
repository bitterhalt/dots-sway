#!/usr/bin/env bash
# https://github.com/bitterhalt

set -e

tofi-drun --prompt-text  " >>" \
   --min-input-width 120 \
   --num-results  15 \
   --drun-launch=true \
   --font-size  16  \
   --anchor  top \
   --border-width  0 \
   --height  30 \
   --horizontal  true \
   --outline-width  0 \
   --padding-bottom  0 \
   --padding-left 0 \
   --padding-right  0 \
   --padding-top  0 \
   --prompt-padding  10 \
   --result-spacing  15 \
   --width  100% 

