alias ls='ls --color=auto'                         # enable if terminal does not show ls colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# pacman
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias pacs='sudo pacman -S'                      # Install standard pkg
alias pacsyu='sudo pacman -Syu'                  # Update the system and upgrade all system packages
alias pacsyy='sudo pacman -Syy'			         # update the software database
alias pacsyyu='sudo pacman -Syyu'                # synchronize with the repositories and update the system
alias pacdifc='sudo DIFFPROG=meld pacdiff'       # merge or remove pacnew files
alias yep='yay -Pw && yay'                       # Show Arch news before update

## DNF/Flatpak
#alias cleanall='sudo dnf clean all'             #cleans caches
#alias dnfup='sudo dnf update'                   #updates packages
#alias dnfupr='sudo dnf update --refresh'        #updates and refresh packages
#alias flatclean='flatpak uninstall --unused'    #cleans unused packages
#alias flatup='flatpak update'                   #flatpak update
#
##APT
#alias aptacl='sudo apt autoclean'
#alias aptcl='sudo apt clean'
#alias aptup='sudo apt update && sudo apt upgrade'

# Rclone mount
alias m-dbox='rclone --vfs-cache-mode writes mount --daemon "dropbox": ~/dropbox/'
alias m-odrive='rclone --vfs-cache-mode writes mount --daemon "onedrive": ~/onedrive/'

alias sensorwatch='watch -n 1 sensors'
alias history='fc -l 1'

# Dir / exa  / lsd
alias df='df -h'
alias ls='eza -al --group-directories-first'
alias la='eza -a --group-directories-first'

# Trash-cli
alias tp="trash-put"
alias tpe="trash-empty"
alias tpr="trash-restore"

# Weather
alias weather='curl wttr.in/'

# Most usefull alias
alias fortunec='fortune | cowsay'

# Yle-dl
alias yle-update='pip3 install --user --upgrade yle-dl'
alias yle-down='yle-dl --destdir ~/Downloads'

# System Journal
alias loger='journalctl -p 3 -xb'
alias logf='journalctl -f'
alias logx='tail -f .xsession-errors'
alias logr='sudo journalctl --rotate'
alias logs='journalctl --disk-usage'
alias logv='journalctl --verify'
alias logw='sudo journalctl --vacuum-time=1s'


# yt-dlp
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

# Random
alias nvm='sudo nvme smart-log /dev/nvme0'
alias sudoe='sudoedit'
#alias dotfiles='/usr/bin/git --git-dir=$HOME/Documents/.dotfiles/ --work-tree=$HOME'
alias dot='/usr/bin/git --git-dir=$HOME/Documents/.sway-dots/ --work-tree=$HOME'
