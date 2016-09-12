#!/usr/bin/env bash

INSTALL_FLAG=false
UNINSTALL_FLAG=false
TARGET_DIR="/usr/local/bin"

function show_help
{
    echo "\
SYNOPSIS:
    install.sh [OPTION] PACKAGE
OPTIONS:
    --install     Install a package.
    --uninstall   Uninstall a package.
    --help        Show help messages.
EXAMPLE:
    install.sh --install ydcv"
}

if [ "$1" != "" ]; then
    case $1 in
        --install)
            INSTALL_FLAG=true
            shift
            ;;
        --uninstall)
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
