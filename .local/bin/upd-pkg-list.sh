#!/bin/sh

# upd_pkg_list
# Forked from:      samerickson http://github.com/samerickson/dotfiles
#
# Description:      Creates or updates plain text lists of installed packes to make it easier to reinstall Arch Linux
#
# pkgs-pacman.txt:  all user installed applications from pacman
# pkgs-aur.txt:     all user installed applications from AUR
# packages.txt:     all packages installed on the system
#
# Requirements:
# pacman
#

location="$HOME/.pkg-lists"

pacman -Qett | grep -v "$(pacman -Qem)" > $location/pkgs-pacman.txt
pacman -Qqm > $location/pkgs-aur.txt
pacman -Q > $location/packages.txt
