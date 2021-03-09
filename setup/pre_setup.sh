#!/bin/bash

source ./messages.sh

# This script checks all requirements for setup

message_info "Checking requirements for setup scripts."
sudo pacman -Sq --needed --noconfirm rofi > /dev/null
message_done "Requirements done."
