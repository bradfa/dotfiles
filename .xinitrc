#!/bin/bash

# Execute .Xresources if present to set colors and such
if [[ -f ~/.Xresources ]]; then
	xrdb -merge ~/.Xresources
fi

# For t420s laptop, run xbattbar for a nice battery level display on the right
# using my multi-battery acpi readout script
if [[ $(hostname) == "t420s" || $(hostname) == "t530" ]]; then
	xbattbar -a -t 1 -c -i "green" right -s ~/bin/acpi-battery-percent.sh &
#	volumeicon &
fi

# For preci host, rotate both displayport outputs and put DP-1
# to the right of DP-0.  The left-most monitor is the main one.
# For some strange reason, sometimes the 2nd monitor comes up as
# DP-4 (so the outputs end up numbered 0, 4, 5, 6 which makes no
# sense.
# Also enable left handed mousing.
if [[ $(hostname) == "presci" ]]; then
	xrandr --output DisplayPort-0 --rotate left
	xrandr --output DisplayPort-1 --rotate right --right-of DisplayPort-0
	xrandr --output DisplayPort-4 --rotate right --right-of DisplayPort-0
	xmodmap ~/.xmodmap # enable button mapping, left hand mouse
fi

# Start network-manager applet
nm-applet &

# Start dropbox
dropbox start &

# Screensaver and screen locking
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &

# Start syncthing
syncthing -no-browser &

# Keyboard repeat rate, 300 ms delay, 40 Hz
xset r rate 300 40

# Start xcompmgr so screen sharing works correctly
xcompmgr -c -l0 -t0 -r0 -o.00 &

# Start window manager
exec awesome # wm
