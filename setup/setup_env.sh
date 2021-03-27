#!/bin/bash

source ./variables.sh
source ./messages.sh

message_info "Requesting for env setup."
OUTPUT=$(cat $DOTFILES_SETUP/env.example | rofi -dmenu -format 's\n' 2> /dev/null | sed 's/\\n//g')
if ! [ -z $OUTPUT ]
then
   echo -n $OUTPUT > $DOTFILES_ENV_FILE
fi
message_done "Env setup done."
