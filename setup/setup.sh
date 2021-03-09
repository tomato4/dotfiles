#!/bin/bash

source ./messages.sh

# Check all requirements for setup
#source ./pre_setup.sh

# Open rofi menu with all commands available
message_info "Opening menu for commands. Multiple items can be selected by holding shift."
OUTPUT=$(cat ./cmdList | rofi -dmenu -multi-select -format 's\n' 2> /dev/null | sed 's/\\n//g')
PRINT=$(echo "$OUTPUT" | sed -z 's/\n/, /g')
message_info "Selected commands: ${PRINT::-2}"

while IFS= read -r line
do
   # TODO do for each line
   echo $line
done <<< "$OUTPUT"

#for cmd in "${commands[@]}"
#do
#   echo $cmd
#done
