#!/bin/sh
exec awesome
eval $(gpg-agent --daemon) &
xmodmap ~/.xmodmap
xscreensaver -no-splash &
xset r rate 300 40
