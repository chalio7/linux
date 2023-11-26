#!/bin/sh

# killall transmission-daemon
# transmission-daemon &
# setxkbmap -option caps:swapescape
# sxhkd &
# xset r rate 300 50
# dunst &
# fcitx -d &
# xwallpaper --zoom ~/.config/wall.png
# picom --experimental-backends &
# dwmblocks &
# exec dwm
#


# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. There is a link to this file in ~/.xprofile
# because that file is run automatically if someone uses a display manager
# (login screen) and so they are needed there. To prevent doubling up commands,
# I source them here with the line below.

[[ -f ~/.config/x11/xresources ]] && xrdb -merge -I$HOME ~/.config/x11/xresources
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi

ssh-agent dwm



# Start graphical server on user's current tty if not already running.
# [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
