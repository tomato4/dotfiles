#!/bin/bash

source ./variables.sh
source ./messages.sh

# Check all requirements for setup
source ./pre_setup.sh

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
