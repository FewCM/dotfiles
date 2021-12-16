#!/usr/bin/env bash
alias gpg=gpg --homedir "$XDG_DATA_HOME"/gnupg
alias dots='DOTBARE_DIR="$HOME/.local/share/dotfiles/home" DOTBARE_TREE="$HOME" DOTBARE_BACKUP="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles/home-backup" dotbare'
alias fcd='cd "$(fzfx cd)"'
alias pass='nocorrect pass'
alias cat=bat
##alias
alias rm='rm -I '

# Linux specific aliases, work on both MacOS and Linux.
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias sudo='sudo -H '
alias visudo='sudo -E visudo'
alias e='$EDITOR'
alias sedit='sudo micro'

## Disk usage ##
alias dfsys='df -Tha --total'
alias ncdux='ncdu -e -2 --si --confirm-quit --color dark --exclude-caches -x /'
alias ncdu.='ncdu -e -2 --si --confirm-quit --color dark --exclude-caches .'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..='cd .. 2>/dev/null || cd "$(dirname $PWD)"' # Allows leaving from deleted directories
alias ~='cd ~'                                       # `cd` is probably faster to type though

alias pacmaninst='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} --preview-window=wrap:right:40%  | less)"'


#merge new settings
alias merge='xrdb -merge ~/.Xresources'

#youtube-dl
alias yta-mp3='youtube-dl --embed-thumbnail --extract-audio --audio-format mp3 '
alias yta='youtube-dl -f bestaudio --extract-audio --audio-format mp3  --embed-thumbnail  '
alias yt='youtube-dl -v'

#Recent Installed Packages
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'
alias riplong='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -3000 | nl'

## general use
##ls
#alias l='logo-ls -l --time-style=Stamp --almost-all'

if command -v exa &> /dev/null; then
	alias ls='exa --icons'
	alias lls='exa --long --header --sort=Filename --group-directories-first --icons --color=always'
	alias la='exa --sort=Filename --group-directories-first --all --icons --color=always'
	alias lla='exa --long --header --sort=Filename --group-directories-first --all --icons --color=always'
else
	alias ls='ls --color'
	alias lls='ls --color -l --group-directories-first'
	alias la='ls --color -A'
	alias lla='ls --color -lA --group-directories-first'
fi
# Reload the shell (i.e. invoke as a login shell)
#alias reload='exec "${SHELL}" "$@"'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'

alias zshrc='micro ~/.config/zsh/.zshrc'

alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias dd='dd status=progress'
alias diff='diff --color=auto'
#alias dots='/usr/bin/git --git-dir=$HOME/repos/dotfiles/ --work-tree=$HOME/'
alias config='git --git-dir "${DOTFILES_DIR}" --work-tree "${DOTFILES_TREE}"'

# Gitt
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
