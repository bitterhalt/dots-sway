#!/bin/bash

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

[ "$vol" != "${vol%\[MUTED\]}" ] && echo "󰝟" && exit

vol="${vol#Volume: }"

split() {
	IFS=$2
	set -- $1
	printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
	$((vol >= 40)) ) icon="" ;;
	$((vol >= 1)) ) icon="" ;;
	* ) echo "󰝟" && exit ;;
esac

echo "$icon"
