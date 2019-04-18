#!/usr/bin/env bash

INSTALL_FLAG=false
UNINSTALL_FLAG=false
TARGET_DIR="$HOME/.local/"

function show_help
{
    echo "\
SYNOPSIS:
    install.sh [OPTION] PACKAGE
OPTIONS:
    -i, --install     Install a package.
    -d, --delete      Delete a package.
    -h, --help        Show help messages.
EXAMPLE:
    install.sh -i ydcv"
}

if [ "$1" != "" ]; then
    case $1 in
        -i | --install)
            INSTALL_FLAG=true
            shift
            ;;
        -d | --delete)
            UNINSTALL_FLAG=true
            shift
            ;;
        *)
            show_help
            exit
            ;;
    esac
else
    show_help
    exit
fi

if [ "$1" != "" ]; then
    for pkg in $@
    do
        if $INSTALL_FLAG; then
            stow -t $TARGET_DIR -S "$pkg"
            echo "$pkg installed."
        fi
        if $UNINSTALL_FLAG; then
            stow -t $TARGET_DIR -D "$pkg"
            echo "$pkg uninstalled."
        fi
    done
fi
