#!/bin/bash

source ./colors.sh

message_error(){
    echo -e "$SETUP_COLOR_RED$SETUP_FORMATING_BOLD[ERROR]$SETUP_COLOR_RESET $1"
}

message_done() {
   echo -e "$SETUP_COLOR_GREEN$SETUP_FORMATING_BOLD[DONE]$SETUP_COLOR_RESET $1"
}

message_warn () {
   echo -e "$SETUP_COLOR_ORANGE$SETUP_FORMATING_BOLD[WARN]$SETUP_COLOR_RESET $1"
}

message_info () {
   echo -e "$SETUP_COLOR_WHITE$SETUP_FORMATING_BOLD[INFO]$SETUP_COLOR_RESET $1"
}

