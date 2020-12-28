#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#PS1='\033[01;34m\]\u\033[0m\]@\h \[\e[1m\]\W\[\e[0m\] % '
#PS1='\[\e[0;34m\]\u\[\e[m\]@\h \[\e[1m\]\W\[\e[m\]: % '
PS1=' \[\e[0;34m\]\W\[\e[m\] | '
#PS1=' \[\e[0;34m\]\W\[\e[m\] | % '
#PS1=' [\h] \[\e[0;34m\]\W\[\e[m\] | '

[[ $TERM == "st-256color" ]] && exec tmux

alias ls='ls -N --color=auto'
alias ll='ls -l'
alias l='ls'
alias vi='vim'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
alias halt='sudo systemctl halt'
alias stb="st -f 'Liberation Mono-12'"
alias startx='ssh-agent startx'
alias ssh='TERM=xterm ssh'

export HISTSIZE=5000
export EDITOR=vim

set -o vi

# start screen
#if [ -z "$STARTED_SCREEN" ] && [ -n "$SSH_TTY" ]
#then
#  case $- in
#    (*i*)
#      STARTED_SCREEN=1; export STARTED_SCREEN
#      mkdir -p -- "$HOME/lib/screen-logs"
#      screen -RR -S main  ||
#        echo >&2 "Screen failed! continuing with normal bash startup"
#  esac
#fi

export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions'
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export ANDROID_HOME='/opt/android-sdk'

# Android SDK
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/tools/
PATH=$ANDROID_HOME/emulator:$PATH

