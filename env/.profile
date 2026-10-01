#!/bin/sh
#
# ╔═════════════════════════════════════════════════════════════════╗
# ║                                                                 ║
# ║                                   ██████   ███  ████            ║
# ║                                  ███░░███ ░░░  ░░███            ║
# ║   ████████  ████████   ██████   ░███ ░░░  ████  ░███   ██████   ║
# ║  ░░███░░███░░███░░███ ███░░███ ███████   ░░███  ░███  ███░░███  ║
# ║   ░███ ░███ ░███ ░░░ ░███ ░███░░░███░     ░███  ░███ ░███████   ║
# ║   ░███ ░███ ░███     ░███ ░███  ░███      ░███  ░███ ░███░░░    ║
# ║   ░███████  █████    ░░██████   █████     █████ █████░░██████   ║
# ║   ░███░░░  ░░░░░      ░░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░    ║
# ║   ░███                                                          ║
# ║   █████                                                         ║
# ║  ░░░░░                                                          ║
# ║                                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
#
# This file contains all commands that should be run by all login shells

# Check if the shell running is ash, and if so, set startup file in $ENV.
if [ "$0" = "-ash" ] || [ "$0" = "dash" ] || [ "$0" = "-sh" ] ; then
     export ENV="$HOME/.ashrc"
fi

# machine specific settings
# YOLANDA
# - has /home mounted via NFS
if [ "$(hostname)" = "yolanda" ] ; then
	# put XDG_CACHE_HOME on local disk instead of /home
	# this assumes per user directories in /var/local with the correct ownerships
    export XDG_CACHE_HOME="/var/local/$USER/cache"
    # mount ~/.var to /var/local/$USER/var
    # needs this in the /etc/fstab, but with manually expanded $USER vars:
    # /var/local/$USER/var	/home/$USER/.var	none	bind,noauto,user,exec	0	0
    mount $HOME/.var
fi

# set XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"

# run spotifyd, if available
if [ -f "/usr/bin/spotifyd" ] ; then
   spotifyd >/dev/null
fi

# run onedrive
if [ -f "/usr/bin/onedrive" ] ; then
    if ! pgrep onedrive >/dev/null ; then
       onedrive -m --enable-logging >/dev/null &
    fi
fi

# autostart ssh-agent
# source: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
if ! pgrep ssh-agent > /dev/null; then
    ssh-agent > "/tmp/ssh-agent-$USER.env"
    if test -z "$SSH_AUTH_SOCK"; then
        . "/tmp/ssh-agent-$USER.env" >/dev/null
    fi
fi
