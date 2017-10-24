#!/bin/bash

# Execute .Xresources if present to set colors and such
if [[ -f ~/.Xresources ]]; then
	xrdb -merge ~/.Xresources
fi

# For kaim-eeyore and pooh hosts, use left handed mouse config in xmodmap
if [[ $(hostname) == "kaim-eeyore" || $(hostname) == "pooh" ]]; then
	xmodmap ~/.xmodmap # enable button mapping, left hand mouse
fi

# For piglet host, run xbattbar for a nice battery level display on the right
# using my multi-battery acpi readout script
if [[ $(hostname) == "piglet" ]]; then
	xbattbar -a -t 1 -c -i "green" right -s ~/bin/acpi-battery-percent.sh &
fi

# Always set DPI to 72, it's just sane
xrandr --dpi 72

# Start syncthing without launching the browser
syncthing -no-browser &

# Screensaver and screen locking
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &

# Keyboard repeat rate, 300 ms delay, 40 Hz
xset r rate 300 40

# Start window manager
exec awesome # wm
