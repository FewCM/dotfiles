#!/usr/bin/env bash

export BAT_STYLE='changes,numbers'
if bat --list-themes | grep Gruv 2>&1 > /dev/null; then
  export BAT_THEME='Gruv'
else
  export BAT_THEME='gruvbox'
fi
