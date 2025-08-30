#! /usr/bin/env ksh

# source common environment
if [ -f "$HOME/.env" ]; then
        # shellcheck source=/dev/null
        . "$HOME/.env"
fi

# source common configuration
if [ -f "$HOME/.rc" ]; then
        . "$HOME/.rc"
fi

# prompt
# set colors
NORMAL="\033[0m"
RED="\033[1;31m"
# check if running in ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
        if [ "$USER" = root ] ; then
		PS1="$(print "$RED\${?#0}$NORMAL [ssh: $RED$USER$NORMAL@$(hostname)] $PWD # ")"
        else
		PS1="$(print "$RED\${?#0}$NORMAL [ssh: $USER@$(hostname)] \$PWD \$ ")"
        fi
else
        if [ "$USER" = root ] ; then
		PS1="$(print "$RED\${?#0}$NORMAL $RED$USER$NORMAL in $PWD # ")"
        else
		PS1="$(print "$RED\${?#0}$NORMAL $PWD $ ")"
        fi
fi
