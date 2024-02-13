# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Defaults
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

autoload -U colors && colors
setopt prompt_subst
PROMPT='%B%F{green}%1~%b%f%F{red}$(_git_info)%f %(?.%F{magenta}$%f .%F{red}$%b%f )'
setopt auto_cd                          # Move between directories without cd

# History
HISTSIZE=5000                           # Maximum events for internal history
SAVEHIST=5000                           # Maximum events in history file
HISTFILE=~/.zsh_history                 # History filepath
setopt APPEND_HISTORY                   # Immediately append history instead of overwriting
setopt HIST_IGNORE_ALL_DUPS             # Delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_SPACE                # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS                # Do not write a duplicate event to the history file
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward
bindkey '^x' autosuggest-toggle

# Basic auto/tab complete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# Load aliases and functions if existent.
[ -f "$HOME/.config/zsh/aliases" ] && source "$HOME/.config/zsh/aliases"
[ -f "$HOME/.config/zsh/functions" ] && source "$HOME/.config/zsh/functions"
[ -f "$HOME/.config/zsh/git_prompt" ] && source "$HOME/.config/zsh/git_prompt"

# Plugin list; put syntax-highlighting last!
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
