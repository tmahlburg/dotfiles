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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source common environment
if [ -f "$HOME/.env" ]; then
	# shellcheck source=/dev/null
	source "$HOME/.env"
fi

# source common configuration
if [ -f "$HOME/.rc" ]; then
	source "$HOME/.rc"
fi

# BASH PROMPT #
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[$RETVAL] "
}

function rightprompt() {
	printf "%*s" $COLUMNS "$(date +%R)"
}

PS1="\[$(tput sc; rightprompt; tput rc)\]\[\e[31m\]$(nonzero_return)\[\e[m\]\u@\h \W \\$ "
