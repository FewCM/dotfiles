#!/bin/zsh
zmodload zsh/zprof 
export GPG_TTY=$TTY

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# A binary Zsh module which transparently and automatically compiles sourced scripts
#module_path+=( "/home/fewcm/.local/share/zinit/module/Src" )
#zmodload zdharma_continuum/zinit &>/dev/null

#eval $(gnome-keyring-daemon --components=secrets,pksc11 --start --foreground)
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/gpg-agent/gpg-agent.plugin.zsh
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh
#zstyle :omz:plugins:keychain agents gpg
#zstyle :omz:plugins:keychain identities B78563BE
#zstyle :omz:plugins:keychain options --quiet --absolute --dir "$XDG_RUNTIME_DIR"/keychain
#zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/keychain/keychain.plugin.zsh
#eval_keychain()
eval $(keychain --agents gpg  --eval B78563BE  --noask --quiet --absolute --dir "$XDG_RUNTIME_DIR"/keychain)

typeset -F4 SECONDS=0

zinit ice wait lucid multisrc"01-zopts.zsh \
02-zcomple.zsh \
03-zkbd.zsh \
04-aliases.zsh \
05-alias-reveal.zsh \
06-functions.zsh \
07-fzf.zsh \
08-autoload.zsh \
09-bash.command-not-found \
10-fzf-tab.zsh" 
zinit light $ZDOTDIR/zlib

zinit light-mode for \
        zdharma-continuum/zinit-annex-patch-dl \
        zdharma-continuum/zinit-annex-submods \
        zdharma-continuum/zinit-annex-patch-dl \
        NICHOLAS85/z-a-linkman \
        NICHOLAS85/z-a-linkbin

#zinit ice load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]'  from"gh-r" as"command" atload'eval "$(starship init zsh) ; export STARSHIP_CONFIG=~/.config/starship/config.toml"'
#zinit load starship/starship

zinit ice  from"gh-r" as"command" atload'eval "$(starship init zsh) ; export STARSHIP_CONFIG=~/.config/starship/config.toml"'
zinit load starship/starship

zinit pack'binary+keys' for fzf

zinit ice depth'1' lucid
zinit light bigH/auto-sized-fzf

## colors {{{
#zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    #atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    #atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
#zinit light trapd00r/LS_COLORS

zinit lucid reset \
 atclone"[[ -z ${commands[dircolors]} ]] && local P=g
    \${P}sed -i '/txt/c\txt 38;5;172' LS_COLORS; \
    \${P}dircolors -b LS_COLORS > clrs.zsh" \
 atpull'%atclone' pick"clrs.zsh" nocompile'!' \
 atload'zstyle ":completion:*:default" list-colors "${(s.:.)LS_COLORS}";' for \
    trapd00r/LS_COLORS
    
#zinit \
    #atclone'[[ -z ${commands[dircolors]} ]] &&
      #local P=${${(M)OSTYPE##darwin}:+g};
      #${P}sed -i '\''/txt/c\txt 38;5;172'\'' LS_COLORS;
      #${P}dircolors -b LS_COLORS >! clrs.zsh' \
    #atload'zstyle '\'':completion:*:default'\'' list-colors "${(s.:.)LS_COLORS}";' \
    #atpull'%atclone' \
    #git \
    #id-as'trapd00r/LS_COLORS' \
    #lucid \
    #nocompile'!' \
    #pick'clrs.zsh' \
    #reset \
  #for @trapd00r/LS_COLORS

zinit light "chrissicool/zsh-256color"
# }}}

zinit ice wait'0a' lucid
zinit light mafredri/zsh-async

zinit ice wait'0a' blockf lucid atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit lucid from'gh-r' for \
  mv'bat* -> bat' \
  pick'bat/bat' \
  as'command' \
  atclone'cp -vf bat/bat.1 "$ZINIT[MAN_DIR]/man1"; cp -vf bat/autocomplete/bat.zsh "bat/autocomplete/_bat"' \
  atpull'%atclone' \
  '@sharkdp/bat' 

zinit ice lucid id-as"ogham/exa_completions" pick"/dev/null" from'gh-r'  atclone'cp -vf completions/exa.zsh _exa; cp -vf man/exa.1 "$ZINIT[MAN_DIR]/man1"; cp -vf man/exa_colors.5 "$ZINIT[MAN_DIR]/man5"' atpull'%atclone'
zinit light ogham/exa 

# FD
zinit ice lucid wait'0b' as'command' from"gh-r" mv"fd* -> fd" pick"fd/fd" atclone'cp -vf fd/fd.1 "$ZINIT[MAN_DIR]/man1"' atpull'%atclone'
zinit light sharkdp/fd

# RIPGREP
zinit ice lucid wait'0c' as'command' from"gh-r" mv'ripgrep* -> rg' pick'rg/rg' atclone'cp -vf rg/doc/rg.1 "$ZINIT[MAN_DIR]/man1"' atpull'%atclone' 
zinit light BurntSushi/ripgrep

zinit ice wait'0d' atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' lucid     
zinit light hlissner/zsh-autopair 

zinit light agkozak/zsh-z
zinit light agkozak/zhooks

zinit ice wait'1a' lucid  atload'bindkey "^d" dotbare-fedit' 
zinit light kazhala/dotbare

zinit light jgogstad/passwordless-history

zinit ice wait'1a' lucid src'fzf-extras.sh' lucid
zinit light atweiden/fzf-extras

zinit ice wait'1' as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX" lucid
zinit light tj/git-extras

#zinit ice wait'0b' lucid as"command" pick"dirhist" src'directory-history.plugin.zsh' atclone"sed -i 's|.directory_history|.config\/zsh\/dir_history|g' directory-history.plugin.zsh ; sed -i 's|.directory_history|.config\/zsh\/dir_history|g' dirhist" 
#zinit light tymm/zsh-directory-history

zinit ice wait'0e' lucid atclone"cp -vf zsh.completion _gopass" id-as"gopasspw/gopass_completions" pick"/dev/null"
zinit light gopasspw/gopass
# Diff
# Diff
#zinit ice lucid as"program" pick"bin/git-dsf"
#zinit light zdharma-continuum/zsh-diff-so-fancy

#zinit ice depth=1 atload'source $ZDOTDIR/zlib/plugin_option/zsh-vi-mode.zsh' lucid
#zinit light jeffreytse/zsh-vi-mode

source $ZDOTDIR/zlib/00-bootstrap.zsh
zinit ice wait'0b' atload'!_zsh-history-substring-search-setting'  lucid
zinit light zsh-users/zsh-history-substring-search
zinit ice wait'0a' atload'!_zsh_autosuggest_start; _zsh_autosuggest_setting' lucid
zinit light zsh-users/zsh-autosuggestions

_per-directory-history-settings()
{
	export PER_DIRECTORY_HISTORY_BASE=$ZDOTDIR/.zsh_history_dirs
}

zinit wait'2' lucid \
  atinit"export HISTORY_START_WITH_GLOBAL=true ;  _per-directory-history-settings" \
  atload"_per-directory-history-set-global-history" \
  light-mode for @CyberShadow/per-directory-history

#zinit ice depth'1' lucid wait'0' atinit'ZINIT[COMPINIT_OPTS]=-C;_zpcompinit_custom; zpcdreplay'
#zinit light zsh-users/zsh-syntax-highlighting

 # initialization
_zpcompinit_custom() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR/.zcompdump}
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session
  if [[ -f "$zcd"(#qN.m+1) ]]; then
        compinit -i -d "$zcd"
        { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
        compinit -C -d "$zcd"
        { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}

zinit ice depth'1' lucid wait'0' 
zinit light zdharma-continuum/fast-syntax-highlighting 
    
# FZF-TAB
zinit ice wait'2' lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" 
zinit light Aloxaf/fzf-tab

chpwd() exa -h --git --icons --group-directories-first

#MYPROMPT=2

#source $ZDOTDIR/.env

print "[zshrc] ZSH took ${(M)$(( SECONDS * 1000 ))#*.?} ms"

