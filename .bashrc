#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export DOTFILES_TREE="$HOME"
export DOTFILES_DIR="$HOME/.local/share/dotfiles/home"
export DOTFILES_BACKUP_DIR="$HOME/.local/share/dotfiles/home/home_backup"

alias dots='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles/home --work-tree=$HOME'
