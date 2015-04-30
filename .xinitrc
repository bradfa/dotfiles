#!/bin/sh
exec awesome # wm
eval $(gpg-agent --daemon) & # for smart card
xmodmap ~/.xmodmap # enable button mapping, left hand mouse
xscreensaver -no-splash & # start screen saver daemon
xset r rate 300 40 # keyboard repeat rate, 300 ms delay 40 hz
