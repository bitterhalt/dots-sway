# PATH
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Path
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/fzf-opts"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# SSH agent
export SSH_AUTH_SOCK=${HOME}/.ssh/agent
if ! pgrep -u ${USER} ssh-agent > /dev/null; then
    rm -f ${SSH_AUTH_SOCK}
fi
if [ ! -S ${SSH_AUTH_SOCK} ]; then
    eval $(ssh-agent -a ${SSH_AUTH_SOCK} 2> /dev/null)
fi
# Gnupg as SSH-agent
#export SSH_AGENT_PID=""
#export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# Start sway environment
 if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
   exec $HOME/.local/bin/sway-start
 fi



