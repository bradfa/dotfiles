#!/bin/sh
exec startxfce4
eval $(gpg-agent --daemon) &
