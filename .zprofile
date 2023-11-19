# Defaults
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="foot"
export BROWSER="firefox"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/wayland-scripts:$PATH"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up:
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"


# Sway things
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway > ~/.local/state/sway.log 2>&1
fi



