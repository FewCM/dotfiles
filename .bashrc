#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

DOTFILES_TREE="$HOME"
DOTFILES_DIR="$HOME/.local/share/dotfiles/home"
DOTFILES_BACKUP_DIR="$HOME/.local/share/dotfiles/home/home_backup"
DOTFILES_REMOTE_URL="https://github.com/FewCM/dotfiles.git"
