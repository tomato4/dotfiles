#!/bin/bash

source ./variables.sh
source ./messages.sh

# This script checks all requirements for setup

install(){
    if ! [[ $(pacman -Qe | grep "$1") ]]
    then
        if confirm "Required app $1 is not installed. Install?"
        then
            install_pacman $1
        fi
    fi
}

install_and_check(){
    CMD=$1
    PKG=$2

    if [ -z "$PKG" ]
    then
        PKG=$CMD
    fi

    install $PKG
    check $CMD
}

message_info "Checking requirements for setup scripts."

if [[ $IS_MAC -ne 0 ]]
then
    message_info "Linux detected. Checking requirements."
    install yay
    install rofi
    if ! check pkgconf
    then
        install_and_check pkgconf base-devel
    fi
    install_and_check python
else
    message_info "Mac detected. Checking requirements."
    if ! check brew
    then
        message_error "Brew is not installed. Exiting..."
        dd 1
    fi
    install_brew python
fi

for file in $DOTFILES_SETUP/scripts/*
do
   chmod +x $file
done

if ! [[ -f $DOTFILES_SETUP/env ]]
then
   message_warn "Enviroment not set. Setup enviroment var before continuing."
   source ./setup_env.sh
fi

message_done "Requirements done."
