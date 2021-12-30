#!/usr/bin/env bash

DIR="$(pwd)"
CLEAN="$DIR-clean"
OLD="$CLEAN-old"

cd ../

build_pkgs () {
	if [[ -d "$CLEAN" ]]; then
		mv -f "$CLEAN" "$OLD" &&
		cp -rf "$DIR" "$CLEAN" &&
		cd "$CLEAN" &&
		make && flexipatch-finalizer.sh  -o . -d . -r --debug &&
		sudo make clean install
	else
		cp -rf "$DIR" "$CLEAN" &&
		cd "$CLEAN" &&
		make && flexipatch-finalizer.sh  -o . -d . -r --debug &&
		sudo make clean install
	fi
}
build_pkgs 
