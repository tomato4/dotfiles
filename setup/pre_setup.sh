#!/bin/bash

source ./variables.sh
source ./messages.sh

# This script checks all requirements for setup

check(){
    if ! $(which $1 > /dev/null 2>&1)
    then
        message_error "$1 is not installed. Exiting..."
        dd 1
    fi
}

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

install_and_check rofi
install_and_check yay
if ! $(which pkgconf > /dev/null 2>&1)
then
    install_and_check pkgconf base-devel
fi
install_and_check pip python-pip

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
