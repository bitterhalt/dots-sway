# If not running interactively, don't do anything
[[ $- != *i* ]] && return

autoload -U colors && colors
setopt prompt_subst

PROMPT='%B%F{green}%1~%b%f%F{red}$(_git_info)%f %(?.%F{magenta}$%f .%F{red}$%b%f )'
# History
HISTSIZE=5000                           # Maximum events for internal history
SAVEHIST=5000                           # Maximum events in history file
HISTFILE=~/.zsh_history                 # History filepath
setopt append_history                   # Immediately append history instead of overwriting
setopt hist_ignore_all_dups             # If a new command is a duplicate, remove the older one
setopt hist_save_no_dups                # Do not save duplicated command
setopt auto_cd                          # Move between directories without cd

# Defaults
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Basic auto/tab complete
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

bindkey "^R" history-incremental-pattern-search-backward
bindkey "^F" history-incremental-pattern-search-forward
bindkey '^x' autosuggest-toggle

# Load aliases and functions if existent.
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# Plugin list; put syntax-highlighting last!
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### functions
# Archive extraction. usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Git: https://tarneo.fr/posts/zsh_prompt/
function _git_symbols() {
	# Symbols
	local ahead='↑'
	local behind='↓'
	local diverged='↕'
	local up_to_date='|'
	local no_remote=''
	local staged='+'
	local untracked='?'
	local modified='!'
	local moved='>'
	local deleted='x'
	local stashed='$'

	local output_symbols=''

	local git_status_v
	git_status_v="$(git status --porcelain=v2 --branch --show-stash 2>/dev/null)"

	# Parse branch information
	local ahead_count behind_count

	# AHEAD, BEHIND, DIVERGED
	if echo $git_status_v | grep -q "^# branch.ab " ; then
		# One line of the git status output looks like this:
		# # branch.ab +1 -2
		# In the line below:
		# - we grep for the line starting with # branch.ab
		# - we grep for the numbers and output them on separate lines
		# - we remove the + and - signs
		# - we put the two numbers into variables, while telling read to use a newline as the delimiter for reading
		read -d "\n" -r ahead_count behind_count <<< $(echo "$git_status_v" | grep "^# branch.ab" | grep -o -E '[+-][0-9]+' | sed 's/[-+]//')
		# Show the ahead and behind symbols when relevant
		[[ $ahead_count != 0 ]] && output_symbols+="$ahead"
		[[ $behind_count != 0 ]] && output_symbols+="$behind"
		# Replace the ahead symbol with the diverged symbol when both ahead and behind
		output_symbols="${output_symbols//$ahead$behind/$diverged}"

		# If the branch is up to date, show the up to date symbol
		[[ $ahead_count == 0 && $behind_count == 0 ]] && output_symbols+="$up_to_date"
	fi

	# STASHED
	echo $git_status_v | grep -q "^# stash " && output_symbols+="$stashed"

	# STAGED
	[[ $(git diff --name-only --cached) ]] && output_symbols+="$staged"

	# For the rest of the symbols, we use the v1 format of git status because it's easier to parse.
	local git_status

	symbols="$(git status --porcelain=v1 | cut -c1-2 | sed 's/ //g')"

	while IFS= read -r symbol; do
		case $symbol in
			??) output_symbols+="$untracked";;
			M) output_symbols+="$modified";;
			R) output_symbols+="$moved";;
			D) output_symbols+="$deleted";;
		esac
	done <<< "$symbols"

	# Remove duplicate symbols
	output_symbols="$(echo -n "$output_symbols" | tr -s "$untracked$modified$moved$deleted")"

	[[ -n $output_symbols ]] && echo -n " $output_symbols"
}

# Function to display Git status with symbols
function _git_info() {
local git_info=''
	local git_branch_name=''

	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		# Get the Git branch name
		git_branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)"
		if [[ -n "$git_branch_name" ]]; then
			git_info+="$git_branch_name"
		fi
		# Get the Git status
		git_info+="$(_git_symbols)"
		echo " [$git_info]"
	fi
}


