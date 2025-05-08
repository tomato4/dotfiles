#!/bin/bash

source ./variables.sh
source ./messages.sh
source ./functions.sh

# Check all requirements for setup
./pre_setup.sh

# check env value
if ! [[ -f $DOTFILES_SETUP/env ]]
then
   message_error "Env variable not set. Exiting..."
   dd 1
fi

# set env variable
export DOTFILES_ENV=$(cat "$DOTFILES_ENV_FILE")

# check setups for this env
./env_checker.sh

# if script is run with arguments - scripts
if [ $# -ne 0 ]; then
    OUTPUT=$(printf "%s\n" "$@")
    PRINT=$@
else
    message_info "No arguments provided. Opening menu (rofi) for commands."
    check_and_dd rofi
    # Open rofi menu with all commands available
    message_info "Opening menu for commands. Multiple items can be selected by holding shift."
    OUTPUT=$(for file in ./scripts/*; do basename "$file"; done | rofi -dmenu -multi-select -format 's\n' 2> /dev/null | sed 's/\\n//g')
    PRINT=$(echo "$OUTPUT" | sed -z 's/\n/, /g')
    PRINT=${PRINT::-2}
fi

message_info "Selected commands: $PRINT"
while IFS= read -r line
do
   # skip empty line
   if ! [ "$line" ]; then continue; fi

   # run each selected script
   "$DOTFILES_SETUP_SCRIPTS/$line"

done <<< "$OUTPUT"

message_done "Execution finished."

dd
