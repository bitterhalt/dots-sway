# Tofi scripts for Sway
Some of the scripts are still wip so PM if there is something that does not play well

## Usage
To use as a launcher for Sway, add something similar to the following to your Sway config file:

```
set $menu tofi-run | xargs swaymsg exec --
bindsym $mod+d exec $menu
```
For tofi-drun, there are two possible methods:
```
# Launch via Sway
set $drun tofi-drun | xargs swaymsg exec --
bindsym $mod+Shift+d exec $drun

# Launch directly
set $drun tofi-drun --drun-launch=true
bindsym $mod+Shift+d exec $drun
```
Launch with config:
```
tofi-drun -c /path/to/config/file
```

Remember chmod+x the scripts directory

I should probably list the dependencies but it's easy to find them in scripts if they don't work.. :D

## Rest of the documentation
https://github.com/philj56/tofi

