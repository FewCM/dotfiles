#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4    

dir="$HOME/.config/rofi/$DESKTOP_SESSION/themes"

rofi -modi ":greenclip print" -show  -run-command '{cmd}' -theme $dir/greenclip.rasi