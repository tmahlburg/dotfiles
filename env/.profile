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

# Check if the shell running is ash, and if so, set startup file
# in $ENV.
if [ "$0" = "-ash" ] || [ "$0" = "dash" ] ; then
     export ENV="$HOME/.ashrc"
fi

# check hostname -> graphical (rakete, maschine)
if [ "$(hostname)" = "rakete" ] || [ "$(hostname)" = "maschine" ] ; then
    # set XDG_CONFIG_HOME
    export XDG_CONFIG_HOME="$HOME/.config"

    # set XDG_RUNTIME_DIR if not managed by turnstile (as is in Chimera Linux:
    #   https://chimera-linux.org/docs/configuration/seat)
    if ! pgrep turnstiled > /dev/null ; then
        #  set XDG_RUNTIME_DIR according to htttps://wiki.gentoo.org/wiki/Sway
        if test -z "$XDG_RUNTIME_DIR"; then
            export "XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir"
            if ! test -d "$XDG_RUNTIME_DIR"; then
                mkdir "$XDG_RUNTIME_DIR"
                chmod 0700 "$XDG_RUNTIME_DIR"
            fi
        fi
    fi

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

    # run pipewire, if not handled as a dinit user service
    if ! (test -f "/usr/bin/dinitctl" && dinitctl status pipewire > /dev/null)
    then
        pipewire &
        wireplumber &
        pipewire-pulse &
    fi
# cli only -> generator
elif [ "$(hostname)" = "generator" ] ; then
    "$HOME/bin/alpine-sysinfo"
fi

# autostart ssh-agent
# source: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
if ! pgrep ssh-agent > /dev/null; then
    ssh-agent > "/tmp/ssh-agent-$USER.env"
    if test -z "$SSH_AUTH_SOCK"; then
        . "/tmp/ssh-agent-$USER.env" >/dev/null
    fi
fi

export LANG=de_DE.UTF-8
