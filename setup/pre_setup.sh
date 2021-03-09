#!/bin/bash

source ./variables.sh
source ./messages.sh

# This script checks all requirements for setup

message_info "Checking requirements for setup scripts."
sudo pacman -Sq --needed --noconfirm rofi > /dev/null

for file in $DOTFILES_SETUP/scripts/*
do
   chmod +x $file
done
message_done "Requirements done."
