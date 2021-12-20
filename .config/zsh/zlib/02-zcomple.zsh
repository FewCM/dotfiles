# caching
zstyle ':completion:*' accept-exact '*(N)'


   ## completion system
zstyle ':completion:*:approximate:'                 max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )' # allow one error for every three characters typed in approximate completer
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'              # don't complete backup files as executables
zstyle ':completion:*:correct:*'                    insert-unambiguous true             # start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:corrections'                  format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}' #
zstyle ':completion:*:correct:*'                    original true                       #
zstyle ':completion:*:default'                      list-colors ${(s.:.)LS_COLORS}      # activate color-completion(!)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions'                 format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'  # format on completion
zstyle ':completion:*:*:cd:*:directory-stack'       menu yes select                     # complete 'cd -<tab>' with menu
zstyle ':completion:*:expand:*'                     tag-order all-expansions            # insert all expansions for expand completer
zstyle ':completion:*:history-words'                list false                          #
zstyle ':completion:*:history-words'                menu yes                            # activate menu
zstyle ':completion:*:history-words'                remove-all-dups yes                 # ignore duplicate entries
zstyle ':completion:*:history-words'                stop yes                            #
zstyle ':completion:*'                              matcher-list 'm:{a-z}={A-Z}'        # match uppercase from lowercase
zstyle ':completion:*:matches'                      group 'yes'                         # separate matches into groups
zstyle ':completion:*'                              group-name ''                       # group results by category
if [[ -z "$NOMENU" ]] ; then
  zstyle ':completion:*'                            menu select=2                       # if there are more than 5 options allow selecting from a menu
else
  setopt no_auto_menu # don't use any menus at all
fi
zstyle -e ':completion:*'                           special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'
zstyle ':completion:*:messages'                     format '%d'                         #
zstyle ':completion:*:options'                      auto-description '%d'               #
zstyle ':completion:*:options'                      description 'yes'                   # describe options in full
zstyle ':completion:*:processes'                    command 'ps -au$USER'               # on processes completion complete all user processes
zstyle ':completion:*:*:-subscript-:*'              tag-order indexes parameters        # offer indexes before parameters in subscripts
zstyle ':completion:*'                              verbose true                        # provide verbose completion information
zstyle ':completion:*:warnings'                     format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d' # set format for warnings
zstyle ':completion:*:*:zcompile:*'                 ignored-patterns '(*~|*.zwc)'       # define files to ignore for zcompile
zstyle ':completion:correct:'                       prompt 'correct to: %e'             #
zstyle ':completion::(^approximate*):*:functions'   ignored-patterns '_*'               # Ignore completion functions for commands you don't have:
zstyle ':completion::complete:*'                    gain-privileges 1                   # enabling autocompletion of privileged environments in privileged commands

# complete manual by their section
zstyle ':completion:*:manuals'                      separate-sections true
zstyle ':completion:*:manuals.*'                    insert-sections   true
zstyle ':completion:*:man:*'                        menu yes select

# Kill
zstyle ':completion:*:*:*:*:processes'              command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes'           list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*'                     menu yes select
zstyle ':completion:*:*:kill:*'                     force-list always
zstyle ':completion:*:*:kill:*'                     insert-ids single
 
 ## correction
# run rehash on completion so new installed program are found automatically:
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1 # Because we didn't really complete anything
}

# some people don't like the automatic correction - so run 'NOCOR=1 zsh' to deactivate it
if [[ -n "$NOCOR" ]] ; then
  zstyle ':completion:*'                            completer _oldlist _expand _force_rehash _complete _files
  setopt nocorrect # do not try to correct the spelling if possible
else
  #    zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _correct _approximate _files
  setopt correct  # try to correct the spelling if possible
  zstyle -e ':completion:*'                         completer '
  if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]]; then
    _last_try="$HISTNO$BUFFER$CURSOR"
    reply=(_complete _match _prefix _files)
  else
    if [[ $words[1] = (rm|mv) ]]; then
      reply=(_complete _files)
    else
      reply=(_oldlist _expand _force_rehash _complete _correct _approximate _files)
    fi
  fi'
fi

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
    dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
    hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
    mailman mailnull mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
    operator pcap postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'
    
_fzf_tab_settings(){
# fzf-tab
# disable sort when completing options of any command
zstyle ':completion:complete:*:options' sort false

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string prefix input first

#zstyle ':fzf-tab:complete:(cd|z):*' fzf-preview ' 
#	exa --oneline --long --header --color=always --icons --group-directories-first $realpath 
#'
#zstyle ':fzf-tab:complete:(nvim|vim|micro|nano):*' fzf-preview '
#	bat --style=numbers --color=always --line-range :250 $realpath 2>/dev/null
#'

# 预览 systemctl 状态
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'

zstyle ':fzf-tab:complete:(cd|ls|lsd):*' fzf-preview '[[ -d $realpath ]] && ls -1 --color=always -- $realpath'
zstyle ':fzf-tab:complete:((micro|cp|rm|bat):argument-rest|kate:*)' fzf-preview 'bat --color=always -- $realpath 2>/dev/null || ls --color=always -- $realpath'
zstyle ':fzf-tab:complete:micro:argument-rest' fzf-flags --preview-window=right:65%

#show file contents
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
#export LESSOPEN='|~/.config/zsh/lessfilter %s'
#export LESSOPEN='|file=%s; ~/.config/zsh/lessfilter "$file" | /usr/bin/ifne -n /usr/bin/lesspipe.sh "$file" -o STDOUT 2>/dev/null'

#export  LESSOPEN="|~/.local/bin/lesspipe.sh %s"

#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --color=always -aT -L=2 --group-directories-first --git -I=.git $realpath'
  
#zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview \
#  'echo ${(P)word}'
  
# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'
	
zstyle ':fzf-tab:*' single-group ''
}
