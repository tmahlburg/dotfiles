#!/usr/bin/env zsh

# source common commands
if [ -f "$HOME/.profile" ]; then
	source "$HOME/.profile"
fi

# autostart sway
if [ "$(tty)" = "/dev/tty1" ]; then
	if [ -f "$HOME/.wayland-env" ] ; then
		source "$HOME/.wayland-env"
		dbus-run-session sway &> sway.log
	fi
fi
