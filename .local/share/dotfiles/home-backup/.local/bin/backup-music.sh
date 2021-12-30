#!/usr/bin/env bash

# script to backup Music directory to external hdd
rsync -aAXHv --info=progress2 /home/fewcm/Music/* /run/media/fewcm/Volume/Music
rsync -aAXHv --info=progress2 /home/fewcm/Git/* /run/media/fewcm/Volume/Git
