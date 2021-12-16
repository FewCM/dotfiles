#!/usr/bin/env bash

export DOT_FILES_DIR="$ZDOTDIR/lib"

#export DOT_FILES_ENV="$(cat $DOT_FILES_DIR/env-context)"

# basics with no dependencies
# NB: technically doesn't support auto_source
#source "$DOT_FILES_DIR/sh_utils.sh"


# configs/path (almost everything below needs them to work)
auto_source "$DOT_FILES_DIR/configs/all.sh"

#if [ -n "$DOT_FILES_ENV" ]; then
#  if [ -d "$DOT_FILES_DIR/$DOT_FILES_ENV/bin" ]; then
#    export PATH="$DOT_FILES_DIR/$DOT_FILES_ENV/bin:$PATH"
#  fi
#fi

# NB: may require `bin` and things from `configs`
#auto_source "$DOT_FILES_DIR/functions/all.sh"
#auto_source "$DOT_FILES_DIR/aliases/all.sh"

#auto_source "$DOT_FILES_DIR/zsh-bindings.sh"
#auto_source "$DOT_FILES_DIR/zsh-prompt.sh"
#auto_source "$DOT_FILES_DIR/zsh-shell.sh"

auto_source_initialize
