##  @@@@@@@@   @@@@@@   @@@  @@@  @@@@@@@    @@@@@@@  ##
##  @@@@@@@@  @@@@@@@   @@@  @@@  @@@@@@@@  @@@@@@@@  ##
##       @@!  !@@       @@!  @@@  @@!  @@@  !@@       ##
##      !@!   !@!       !@!  @!@  !@!  @!@  !@!       ##
##     @!!    !!@@!!    @!@!@!@!  @!@!!@!   !@!       ##
##    !!!      !!@!!!   !!!@!!!!  !!@!@!    !!!       ##
##   !!:           !:!  !!:  !!!  !!: :!!   :!!       ##
##  :!:           !:!   :!:  !:!  :!:  !:!  :!:       ##
##   :: ::::  :::: ::   ::   :::  ::   :::   ::: :::  ##
##  : :: : :  :: : :     :   : :   :   : :   :: :: :  ##

# THEMING #
#autoload -Uz promptinit
#promptinit

PROMPT='%~ %# '
RPROMPT='%B%F{red}%(?..%?)%f%b %T'

# Lines configured by zsh-newuser-install             ##
HISTFILE=~/.histfile                                  ##
HISTSIZE=10000                                        ##
SAVEHIST=10000                                        ##
setopt appendhistory autocd                           ##
setopt hist_ignore_space
setopt hist_ignore_all_dups
unsetopt beep                                         ##
bindkey -e                                            ##    ZSH
# End of lines configured by zsh-newuser-install      ## AUTOCONFIG
#                                                     ##
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/tillm/.zshrc'

autoload -Uz compinit
compinit ##
# End of lines added by compinstall
# Cycle through dotfiles on autocompletion
_comp_options+=(globdots)

# Set up better arrow controlled history completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '\eOA' up-line-or-beginning-search # or ^[OA
bindkey '\eOB' down-line-or-beginning-search # or ^[OB

# SYSINFO #
#alsi

source $HOME/.rc

#alias vivaldi-stable='vivaldi'

# SET UP KEY BINDINGS ACCORDING TO https://wiki.archlinux.org/index.php/Zsh#Key_bindings
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
#[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
#[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
#[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
#[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# run ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
