#!/bin/bash

# Setup all my dotfiles.  Call this script from this directory.
# It will create symlinks in your home dir to the files here.

set -e

# Make sure we're calling this script from the directory where it lives
if [ $(dirname ${0}) != "." ]; then
	echo Error: Please call ./setup.sh from $(dirname ${0}).
	exit 1
fi

# We need dialog to ask the user questions, make sure it's installed.
which dialog > /dev/null
if [ ${?} -ne 0 ]; then
	echo Error: Please install the dialog package.
	exit 1
fi

# Ask which email address to use by default for git
GITEMAILFILES=$(find -name ".gitconfig-emailaddress*")
GITEMAILADDRESSES=$(for file in ${GITEMAILFILES}; do grep email ${file} | cut -f2 -d= | tr -d [:blank:]; done)
GITEMAILDIALOGCHOICES=$(for iter in $(seq 1 $(echo ${GITEMAILFILES} | wc -w)); do
				echo -n ${GITEMAILFILES} | cut -f ${iter} -d ' ';
				echo -n ${GITEMAILADDRESSES} | cut -f ${iter} -d ' ';
			done)
GITEEMAILFILE=$(dialog --output-fd 1 --menu "Choose default git email address to use:" 0 0 0 ${GITEMAILDIALOGCHOICES})

# Create the directories needed in the home dir
mkdir -pv ~/.config/gtk-3.0
mkdir -pv ~/.config/awesome

# Create symlinks as needed in the home dir
for file in \
	.bashrc \
	.fonts.conf \
	.gitconfig \
	.gitignore \
	.gtkrc-2.0 \
	.profile \
	.restic.excludes \
	.vimrc \
	.xinitrc \
	.xmodmap \
	.Xresources \
	.xsession; do
	ln -sfv $(pwd)/${file} ~/
done
ln -sfv $(pwd)/gtk-3.0/settings.ini ~/.config/gtk-3.0/
ln -sfv $(pwd)/rc.lua ~/.config/awesome/
