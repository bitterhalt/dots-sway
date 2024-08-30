#!/bin/bash
#
# Riverctl script to open scratchpads, and open programs if Scratchpads are
# empty. Usage "./scratchpads.sh <term|btop|lf|nvim>"
#

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Error: No argument provided."
  exit 1
fi

terminal="footclient"
terminal_tag=$((1 << 11))
lf_tag=$((1 << 12))


term="$terminal --app-id special-term"
lf="$terminal --app-id special-lf -e lf"

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
esac

if lswt | grep -q "$search"; then
  riverctl set-focused-tags "$tag"
else
  riverctl spawn "$cmd"
  riverctl set-focused-tags "$tag"
fi
