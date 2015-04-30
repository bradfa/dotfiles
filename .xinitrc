#!/bin/bash
eval $(gpg-agent --daemon) & # for smart card

# For the rhino host, use left handed mouse config in xmodmap and setup xrandr
# so that DP-1 is above DVI-I-1
if [ $(hostname) == "rhino" ]
then
	xmodmap ~/.xmodmap # enable button mapping, left hand mouse
	xrandr --output DP-1 --above DVI-I-1
fi

xscreensaver -no-splash & # start screen saver daemon
xset r rate 300 40 # keyboard repeat rate, 300 ms delay 40 hz
exec awesome # wm
