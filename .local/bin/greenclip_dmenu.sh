#!/usr/bin/env bash

greenclip print | sed '/^$/d' | dmenu -i -p clipboard | xargs -r -d'\n' -I '{}' greenclip print '{}'

