#!/bin/sh
#
# This file contains all commands that should be run by all login shells
#

# set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"

# set XDG_RUNTIME_DIR according to htttps://wiki.gentoo.org/wiki/Sway
if test -z "$XDG_RUNTIME_DIR"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "$XDG_RUNTIME_DIR"; then
		mkdir "$XDG_RUNTIME_DIR"
		chmod 0700 "$XDG_RUNTIME_DIR"
	fi
fi

# run onedrive
#onedrive -m > onedrive.log &

# autostart sway
if [ "$(tty)" = "/dev/tty1" ]; then
	source $HOME/.wayland-env
	dbus-run-session sway &> sway.log
fi

# autostart ssh-agent
# source: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
