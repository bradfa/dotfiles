#!/bin/bash
eval $(gpg-agent --daemon) & # for smart card

if [ $(hostname) == "rhino" ]
then
	xmodmap ~/.xmodmap # enable button mapping, left hand mouse
fi

xscreensaver -no-splash & # start screen saver daemon
xset r rate 300 40 # keyboard repeat rate, 300 ms delay 40 hz
exec awesome # wm
