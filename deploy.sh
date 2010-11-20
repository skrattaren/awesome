#!/bin/sh

# "Deploys" this config pack,
# i.e. symlink config files to those in this repo
# backing up existing files etc.
# Accepts one argument: specific file to be symlinked as "per-box.lua"

if [ -z "$1" -o ! -f "$1" ]; then
    echo "Set file with box-specific as the first and only argument"
    exit 1
fi

RDIR=$(pwd)/$(dirname $0)

excludes="workstation.lua notebook.lua deploy.sh"

function include() {
    for i in ${excludes[@]}; do
        if [ $i == $1 ]; then
            return 1
        fi
    done
    return 0
}

function symlinkit() {
    SRC=$1
    TRGT=$2
    if [ -L $TRGT ]; then
            echo "Removing old symlink $TRGT..."
        rm "$TRGT"
    elif [ -e $TRGT ]; then
        if [ -e $TRGT~ ]; then
            echo "Both $TRGT and $TRGT~ exist, skipping..."
            return
        fi
        echo "Backing up $TRGT to $TRGT~"
        mv "$TRGT" "$TRGT"~
    fi
    ln -s "$SRC" "$TRGT"
}

FILES=$(ls $RDIR)

CONFDIR=${XDG_CONFIG_HOME="$HOME/.config"}/awesome

if [ -e "$CONFDIR" ]; then
    if [ ! -d $CONFDIR ]; then
        echo "$CONFDIR is not a directory"
        return 1
    fi
    mkdir -p "$CONFDIR"
fi

for f in $FILES; do
    if include $f; then
        symlinkit "$RDIR/$f" "$CONFDIR/$f"
    fi
done

symlinkit "$(pwd)/$1" "$CONFDIR/per-box.lua"

