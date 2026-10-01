#!/bin/bash
#
# ╔══════════════════════════════════════════════════════════════╗
# ║                                                              ║
# ║   █████                       █████                          ║
# ║  ░░███                       ░░███                           ║
# ║   ░███████   ██████    █████  ░███████   ████████   ██████   ║
# ║   ░███░░███ ░░░░░███  ███░░   ░███░░███ ░░███░░███ ███░░███  ║
# ║   ░███ ░███  ███████ ░░█████  ░███ ░███  ░███ ░░░ ░███ ░░░   ║
# ║   ░███ ░███ ███░░███  ░░░░███ ░███ ░███  ░███     ░███  ███  ║
# ║   ████████ ░░████████ ██████  ████ █████ █████    ░░██████   ║
# ║  ░░░░░░░░   ░░░░░░░░ ░░░░░░  ░░░░ ░░░░░ ░░░░░      ░░░░░░    ║
# ║                                                              ║
# ╚══════════════════════════════════════════════════════════════╝
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# switch to zsh immediatly if possible
if [ -f /usr/bin/zsh ] ; then
	exec /usr/bin/zsh
fi

# source common environment
if [ -f "$HOME/.env" ] ; then
	# shellcheck source=/dev/null
	source "$HOME/.env"
fi

# source common configuration
if [ -f "$HOME/.rc" ] ; then
	source "$HOME/.rc"
fi

# prompt
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
	PS1='\[\e[31m\]${?#0} \[\e[0m\]\A [ssh:\h] \w '
else
	PS1='\[\e[31m\]${?#0} \[\e[0m\]\A \w '
fi

if [ $(id -u) -eq 0 ] ; then
	PS1="${PS1}# "
else
	PS1="${PS1}$ "
fi

# source bash completions in OmniOS
if [ -f /usr/share/bash-completion/bash_completion ] ; then
	source /usr/share/bash-completion/bash_completion
fi
