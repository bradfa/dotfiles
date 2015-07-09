#!/bin/bash

# Symlink to this from both ~/.xinitrc and ~/.xsession to ensure it runs on
# every login, regardless of if using `startx` or a login manager.

eval $(gpg-agent --daemon) # for smart card

# For the rhino host, use left handed mouse config in xmodmap and setup xrandr
# so that DP-1 is above DVI-I-1
if [ $(hostname) == "rhino" ]
then
	xmodmap ~/.xmodmap # enable button mapping, left hand mouse
	xrandr --output DP-1 --above DVI-I-1
fi

# Always set DPI to 72, it's just sane
xrandr --dpi 72

xscreensaver -no-splash & # start screen saver daemon
xset r rate 300 40 # keyboard repeat rate, 300 ms delay 40 hz
exec awesome # wm
