#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

xset +fp /usr/share/fonts/local
xset fp rehash

xset +dpms
xset dpms 0 0 300

exec i3
