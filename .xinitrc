#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"
export TERM="st-256color"
export EDITOR="nvim"
export QT_QPA_PLATFORMTHEME="gtk2"

# merge in defaults and keymaps
[ -f /etc/X11/xinit/.Xresources ] && xrdb -merge $sysresources
[ -f /etc/X11/xinit/.Xmodmap ] && xmodmap $sysmodmap
[ -f "$HOME/.Xresources" ] && xrdb -merge $userresources
[ -f "$HOME/.Xmodmap" ] && xmodmap $usermodmap

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done; unset f
fi

setxkbmap us altgr-intl
setbg
dwmstatus.sh &
exec dwm
