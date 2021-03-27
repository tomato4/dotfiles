#!/bin/bash

source ./variables.sh
source ./messages.sh

# This script checks all requirements for setup

message_info "Checking requirements for setup scripts."
if ! [[ $(pacman -Qe | grep "rofi ") ]]
then
   sudo pacman -Sq --needed --noconfirm rofi > /dev/null
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
