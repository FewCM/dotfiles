#!/usr/bin/env bash

# turn off certain `shellcheck` errors
export SHELLCHECK_OPTS="-e SC1090"

command_exists() {
  [ -n "$1" ] && type "$1" >/dev/null 2>&1
}

# these aliases have to be defined so these commands are seen to exist
#if command_exists fdfind; then
#  alias fd=fdfind
#fi

#if command_exists batcat; then
#  alias bat=batcat
#fi

# Add Haskell configs
#if [ -e $HOME/.ghcup/env ]; then
#  auto_source $HOME/.ghcup/env
#elif [ -d "$HOME/.cabal/bin" ]; then
#  export PATH="$HOME/.cabal/bin:$PATH"
#fi

# Add go `bin`
#if [ -d "$HOME/go/bin" ]; then
#  export PATH="$HOME/go/bin:$PATH"
#fi

# Turn RUST_BACKTRACE on
#export RUST_BACKTRACE=1

# Add `utils` - all externally sourced scripts
if [ -d "$DOT_FILES_DIR/utils" ]; then
  export PATH="$DOT_FILES_DIR/utils:$PATH"
fi

if command_exists delta; then
  export DIFF_PAGER="delta --theme=gruvbox --highlight-removed"
elif command_exists diff-so-fancy; then
  export DIFF_PAGER="diff-so-fancy"
else
  export DIFF_PAGER="cat -"
fi

if [ -d "$DOT_FILES_DIR/git-fuzzy" ]; then
  export PATH="$DOT_FILES_DIR/git-fuzzy/bin:$PATH"

  export GF_DEBUG_MODE=""
  export GF_COMMAND_DEBUG_MODE=""
  export GF_COMMAND_FZF_DEBUG_MODE=""
  export GF_COMMAND_LOG_OUTPUT=""
  export GF_INTERNAL_COMMAND_DEBUG_MODE=""

  # export GF_DEBUG_MODE="YES"
  # export GF_COMMAND_DEBUG_MODE="YES"
  # export GF_COMMAND_FZF_DEBUG_MODE="YES"
  # export GF_COMMAND_LOG_OUTPUT="YES"
  # export GF_INTERNAL_COMMAND_DEBUG_MODE="YES"

  export GF_PREFERRED_PAGER="$DIFF_PAGER"
  if command_exists delta; then
    # only add `__WIDTH__` if using `delta` - other pagers don't support it
    export GF_PREFERRED_PAGER="$GF_PREFERRED_PAGER -w __WIDTH__"
  fi

  export GF_HUB_PR_FORMAT="%pC%I%Creset %Cyellow(%ur)%Creset %Cmagenta(%au)%Creset %t %l%n"

  export GF_SNAPSHOT_DIRECTORY="./.git-fuzzy-snapshots"

  export GF_BAT_STYLE="changes"
  export GF_BAT_THEME="gruvbox"

  export GF_GREP_COLOR='1;30;48;5;15'
  export GF_LOG_MENU_PARAMS='--pretty=gflog'
  export GF_REFLOG_MENU_PARAMS='--pretty=gfreflog'
fi
