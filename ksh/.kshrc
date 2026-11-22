#! /usr/bin/env ksh

# source common environment
if [ -f "$HOME/.env" ]; then
	. "$HOME/.env"
fi

# source common configuration
if [ -f "$HOME/.rc" ]; then
	. "$HOME/.rc"
fi

# settings
set -o gmacs
set -o multiline
set -o globstar

export TERM="xterm-256color"

# prompt
# set colors
NORMAL=$'\001\033[0m\002'
RED=$'\001\033[1;31m\002'
# set hostname
typeset host=$(hostname)
# check if running in ssh
if [[ -n $SSH_CLIENT || -n $SSH_TTY || -n $SSH_CONNECTION ]]; then
        if [[ $USER == root ]]; then
                PS1="${RED}"'${?#0}'"${NORMAL} [ssh: ${RED}${USER}${NORMAL}@${host}] "'$PWD'" # "
        else
                PS1="${RED}"'${?#0}'"${NORMAL} [ssh: ${USER}@${host}] "'$PWD'" \$ "
        fi
else
        if [[ $USER == root ]]; then
                PS1="${RED}"'${?#0}'"${NORMAL} ${RED}${USER}${NORMAL} in "'$PWD'" # "
        else
                PS1="${RED}"'${?#0}'"${NORMAL} "'$PWD'" \$ "
        fi
fi
