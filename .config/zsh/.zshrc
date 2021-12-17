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
module_path+=( "/home/fewcm/.local/share/zinit/module/Src" )
zmodload zdharma_continuum/zinit &>/dev/null

#eval $(gnome-keyring-daemon --components=secrets,pksc11 --start --foreground)
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/gpg-agent/gpg-agent.plugin.zsh 
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
08-autoload.zsh 
07-fzf.zsh \
09-bash.command-not-found" 
zinit light $ZDOTDIR/zlib

zinit light-mode for \
        zdharma-continuum/zinit-annex-patch-dl \
        zdharma-continuum/zinit-annex-submods \
        NICHOLAS85/z-a-linkman \
        NICHOLAS85/z-a-linkbin
        
zinit ice depth'1' lucid
zinit light bigH/auto-sized-fzf

#zinit ice as"program" pick"bin/git-fuzzy"
#zinit light bigH/git-fuzzy

# colors {{{
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit light "chrissicool/zsh-256color"
# }}}

zinit ice wait'0a' lucid
zinit light mafredri/zsh-async

zinit ice load'![[ $MYPROMPT = 1 ]]' unload'![[ $MYPROMPT != 1 ]]' nocd atload'source $ZDOTDIR/zlib/plugin_option/prompt.zsh' lucid
zinit light spaceship-prompt/spaceship-prompt

#zinit depth'3' load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]' as'program' for \
	#pick'target/release/starship' \
	#atclone'cargo build --release ; starship completions zsh > _starship ; cargo clean' atpull'%atclone' \
	#atinit'eval $(starship init zsh); export STARSHIP_CONFIG=~/.config/starship/config.toml' \
	#'@starship/starship'

zinit ice load'![[ $MYPROMPT = 2 ]]' unload'![[ $MYPROMPT != 2 ]]'  from"gh-r" as"command" atload'eval "$(starship init zsh) ; export STARSHIP_CONFIG=~/.config/starship/config.toml"'
zinit load starship/starship
#as"command" from"gh-r"  pick"./starship" atclone"eval $(starship init zsh) ; export STARSHIP_CONFIG=~/.config/starship/config.toml"  
#zinit light starship/starship

	#as'command'  from'gh-r'  \
	#atclone'starship completions zsh > _starship ; eval $(starship init zsh)' atpull'%atclone' \
	#atload'export STARSHIP_CONFIG=~/.config/starship/config.toml' lucid \
#zinit light starship/starship

zinit ice wait'0a' src"$ZDOTDIR/zlib/plugin_option/zsh-autosuggestions.zsh" atload'!_zsh_autosuggest_start; _zsh_autosuggest_setting' lucid
zinit light zsh-users/zsh-autosuggestions

#zinit wait'0a' lucid \
  #atinit"source /home/fewcm/.config/zsh/zlib/plugin_option/zsh-autocomplete_atinit.zsh" \
  #atload"source /home/fewcm/.config/zsh/zlib/plugin_option/zsh-autocomplete_atload.zsh" \
  #light-mode for @marlonrichert/zsh-autocomplete

zinit ice wait'0a' blockf lucid atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit lucid from'gh-r' for \
  mv'bat* -> bat' \
  pick'bat/bat' \
  as'command' \
  atclone'cp -vf bat/bat.1 "$ZINIT[MAN_DIR]/man1"; cp -vf bat/autocomplete/bat.zsh "bat/autocomplete/_bat"' \
  atpull'%atclone' \
  '@sharkdp/bat' 

zinit ice lucid as'command' pick'target/release/exa' atclone'cargo build --release' atpull'%atclone'
zinit light FewCM/exa

# FD
zinit ice lucid wait'0b' as'command' from"gh-r" mv"fd* -> fd" pick"fd/fd" atclone'cp -vf fd/fd.1 "$ZINIT[MAN_DIR]/man1"' atpull'%atclone'
zinit light sharkdp/fd

# RIPGREP
zinit ice lucid wait'0c' as'command' from"gh-r" mv'ripgrep* -> rg' pick'rg/rg' atclone'cp -vf rg/doc/rg.1 "$ZINIT[MAN_DIR]/man1"' atpull'%atclone' 
zinit light BurntSushi/ripgrep

zinit ice wait'0d' atload'ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(autopair-insert)' lucid     
zinit light hlissner/zsh-autopair 

# FZF
zinit ice wait'0b' as'command' lucid from'gh-r' 
zinit light junegunn/fzf


 # atinit"source $ZHOMEDIR/rc/pluginconfig/zsh-plugin-fzf-finder_atinit.zsh"  
# FZF
#zinit ice wait'0e' lucid from'gh-r' as'command' atinit'source $ZDOTDIR/zlib/plugin_option/fzf.zsh'
#zinit light junegunn/fzf

# BIND MULTIPLE WIDGETS USING FZF
zinit ice wait'0e' lucid multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf

zinit light agkozak/zsh-z
zinit light agkozak/zhooks

zinit ice wait'1a' lucid  atload'bindkey "^d" dotbare-fedit' 
zinit light kazhala/dotbare

zinit light jgogstad/passwordless-history

zinit ice wait'1a' lucid src'fzf-extras.sh' lucid
zinit light atweiden/fzf-extras

zinit ice as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX"
zinit light tj/git-extras

# FZF-TAB
zinit ice wait'1b' atload'source $ZDOTDIR/zlib/plugin_option/fzf-tab.zsh' lucid
zinit light Aloxaf/fzf-tab


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

source $ZDOTDIR/zlib/plugin_option/zsh-history-substring-search.zsh
zinit ice wait'0b' atload'!_zsh-history-substring-search-setting'  lucid
zinit light zsh-users/zsh-history-substring-search

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

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting 

chpwd() exa -h --git --icons --group-directories-first

MYPROMPT=2

#source $ZDOTDIR/.env

print "[zshrc] ZSH took ${(M)$(( SECONDS * 1000 ))#*.?} ms"

