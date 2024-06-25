#!/bin/bash
# Simple module to displaying pipewire status to waybar. I jad problems with Waubar's default so I addet this. 
vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

[ "$vol" != "${vol%\[MUTED\]}" ] && printf "" && exit

vol="${vol#Volume: }"

split() {
	IFS=$2
	set -- $1
	printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
	$((vol >= 50)) ) icon=" "
 ;;
	$((vol >= 1)) ) icon=""

 ;;
	* ) printf "" && exit ;;
esac

printf "$icon"
