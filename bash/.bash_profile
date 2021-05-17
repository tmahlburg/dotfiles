#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# source common commands
if [ -f "$HOME/.profile" ] ; then
	source "$HOME"/.profile
fi
