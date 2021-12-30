#!/bin/zsh
skip_global_compinit=1

# Start X server if not already running
#[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg 2>&1 > /dev/null && exec startx $XINITRC 2>&1 > /dev/null
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  #exec startx "$XDG_CONFIG_HOME/X11/xinitrc"  -- -keeptty >~/.xorg.log 2>&1
#fi
