#!/bin/bash

# Symlink to this from both ~/.xinitrc and ~/.xsession to ensure it runs on
# every login, regardless of if using `startx` or a login manager.

eval $(gpg-agent --daemon) # for smart card

# Execute .Xresources if present to set colors and such
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# For the kaim-eeyore and pooh hosts, use left handed mouse config in xmodmap
# For the kaim-eeyore host, set xrandr so that DP-1 is left of DVI-I-1
case `hostname` in
	kaim-eeyore)
		xmodmap ~/.xmodmap # enable button mapping, left hand mouse
		xrandr --output DP-1 --left-of DVI-I-1
		;;
	pooh)
		xmodmap ~/.xmodmap # enable button mapping, left hand mouse
		;;
esac

# Always set DPI to 72, it's just sane
xrandr --dpi 72

# Start dropbox, if available
dropbox start

xscreensaver -no-splash & # start screen saver daemon
xss-lock -- xscreensaver-command -lock &
xset r rate 300 40 # keyboard repeat rate, 300 ms delay 40 hz
exec awesome # wm
