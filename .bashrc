# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

alias ls='ls --color=auto'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set PS1
if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
	'
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
unset color_prompt force_color_prompt

# Enable vi mode
set -o vi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR=vim

# Set my name for debian packaging, set email in /etc/mail-name
export DEBFULLNAME="Andrew Bradford"
export DEBEMAIL="andrew@bradfordembedded.com"

# For perforce, because it's a very special kind of VCS
export P4CONFIG=.p4settings

# If $HOME/bin exists, prepend it to PATH
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# For golang
export GOPATH=${HOME}/go/

# Set a locale
export LANG=en_US.UTF-8
