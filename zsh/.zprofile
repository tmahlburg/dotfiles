# set PATH
PATH=/home/tillm/bin:$PATH

# autostart ssh-agent
# source: https://wiki.archlinux.org/index.php/SSH_keys#ssh-agent
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#    eval "$(<~/.ssh-agent-thing)" > /dev/null > /dev/null
#fi

# run onedrive
#onedrive -m > onedrive.log &

# autostart sway
if [ "$(tty)" = "/dev/tty1" ]; then
	source $HOME/.wayland-env
	dbus-run-session sway &> sway.log
fi
