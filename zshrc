# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile


alias ls='ls -N --color=auto'
alias ll='ls -l'
alias l='ls'
alias vi='vim'
alias nnn='nnn -e'
alias n='nnn -e'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'
alias halt='sudo systemctl halt'
alias stb="st -f 'Liberation Mono-12'"
alias startx='ssh-agent startx'
alias ssh='TERM=xterm ssh'

export HISTSIZE=1000
export EDITOR=vim

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

#[[ $TERM == "st-256color" ]] && exec tmux
#[[ $TERM == "alacritty" ]] && exec tmux

bindkey -v
fpath+=$HOME/.zsh/pure

#plugins=(git vi-mode)
#
unsetopt share_history

autoload promptinit
prompt pure

zmodload zsh/nearcolor
zstyle :prompt:pure:path color '#187bcd'

export NNN_OPTS="H"
