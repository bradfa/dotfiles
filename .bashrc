# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# Enable vi mode
set -o vi

export EDITOR=vim

# Set my name for debian packaging, set email in /etc/mail-name
export DEBFULLNAME="Andrew Bradford"

# For perforce, because it's a very special kind of VCS
export P4CONFIG=.p4settings
