#!/bin/bash

cat ~/.config/sway/config | grep 'bindsym' | grep -v '^\s*#' | sed 's/bindsym / /' | bemenu_runner -n -l 15 -p "Search keybindings: "
