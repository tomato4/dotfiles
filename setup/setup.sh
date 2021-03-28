#!/bin/bash

source ./variables.sh
source ./messages.sh

# Check all requirements for setup
source ./pre_setup.sh

# check env value
if ! [[ -f $DOTFILES_SETUP/env ]]
then
   message_error "Env variable not set. Exiting..."
   exit 1
fi

# set env variable
export DOTFILES_ENV=$(cat $DOTFILES_ENV_FILE)

# Open rofi menu with all commands available
message_info "Opening menu for commands. Multiple items can be selected by holding shift."
OUTPUT=$(for file in ./scripts/*; do echo "$(basename $file)"; done | rofi -dmenu -multi-select -format 's\n' 2> /dev/null | sed 's/\\n//g')
PRINT=$(echo "$OUTPUT" | sed -z 's/\n/, /g')
message_info "Selected commands: ${PRINT::-2}"

while IFS= read -r line
do
   # skip empty line
   if ! [ $line ]; then continue; fi

   # run each selected script
   source ./scripts/$line
done <<< "$OUTPUT"

message_done "Execution finished."