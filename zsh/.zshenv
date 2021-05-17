#!/usr/bin/env zsh
##
##  @@@@@@@@   @@@@@@   @@@  @@@  @@@@@@@@  @@@  @@@  @@@  @@@  ##
##  @@@@@@@@  @@@@@@@   @@@  @@@  @@@@@@@@  @@@@ @@@  @@@  @@@  ##
##       @@!  !@@       @@!  @@@  @@!       @@!@!@@@  @@!  @@@  ##
##      !@!   !@!       !@!  @!@  !@!       !@!!@!@!  !@!  @!@  ##
##     @!!    !!@@!!    @!@!@!@!  @!!!:!    @!@ !!@!  @!@  !@!  ##
##    !!!      !!@!!!   !!!@!!!!  !!!!!:    !@!  !!!  !@!  !!!  ##
##   !!:           !:!  !!:  !!!  !!:       !!:  !!!  :!:  !!:  ##
##  :!:           !:!   :!:  !:!  :!:       :!:  !:!   ::!!:!   ##
##   :: ::::  :::: ::   ::   :::   :: ::::   ::   ::    ::::    ##
##  : :: : :  :: : :     :   : :  : :: ::   ::    :      :      ##

if [ -f "$HOME/.env" ] ; then
	source "$HOME/.env"
fi

# ENABLE COLORS IN LESS #
#export LESS=-R
#export LESS_TERMCAP_me=$(printf '\e[0m')
#export LESS_TERMCAP_se=$(printf '\e[0m')
#export LESS_TERMCAP_ue=$(printf '\e[0m')
#export LESS_TERMCAP_mb=$(printf '\e[1;32m')
#export LESS_TERMCAP_md=$(printf '\e[1;34m')
#export LESS_TERMCAP_us=$(printf '\e[1;32m')
#export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# stop /usr/lib/at-spi2-core/at-spi-bus-launcher and /usr/lib/at-spi2-core/at-spi2-registryd --use-gnome-session from start
export NO_AT_BRIDGE=1
