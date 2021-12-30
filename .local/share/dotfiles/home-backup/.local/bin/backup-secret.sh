#!/usr/bin/env bash

# script to backup Music directory to external hdd
rsync -aAXHv --info=progress2 /home/fewcm/Git/my_arch/ /run/media/fewcm/Volume/Secret
