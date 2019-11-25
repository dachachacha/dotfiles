#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='\033[01;34m\]\u\033[0m\]@\h \[\e[1m\]\W\[\e[0m\] % '
PS1='\[\e[0;34m\]\u\[\e[m\]@\h \[\e[1m\]\W\[\e[m\]: % '
PS1=' __ \[\e[0;34m\]\W\[\e[m\] | % '

alias ls='ls --color=auto'
alias ll='ls -l'
alias vi='vim'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
alias halt='sudo systemctl halt'

export HISTSIZE=1000
