#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
#xsetroot -solid "#2C2422"
        
~/.config/lemonbar/lemonbar.sh &

clipmenud &

sxhkd &
export XSESSION_PID="$$"
exec bspwm 2> ~/logs/bspwm.err
