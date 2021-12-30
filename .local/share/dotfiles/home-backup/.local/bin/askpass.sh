#!/usr/bin/env bash
rofi -dmenu\
     -password\
     -i\
     -no-fixed-num-lines\
     -p "Root Password: "\
     -theme $HOME/.config/rofi/themes/askpass.rasi &
