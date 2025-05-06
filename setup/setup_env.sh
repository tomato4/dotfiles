#!/bin/bash

source ./variables.sh
source ./messages.sh

message_info "Requesting for env setup."

DOTFILES_ENV_EXAMPLE="$DOTFILES_SETUP/env.example"

if ! which rofi >/dev/null 2>&1; then
  message_info "Rofi is not available. Using shell input instead."
  OUTPUT=$(input "Enter env variable from these options: $(tr '\n' ' ' < "$DOTFILES_ENV_EXAMPLE")")
else
  OUTPUT=$(cat "$DOTFILES_ENV_EXAMPLE" | rofi -dmenu -format 's\n' 2>/dev/null | sed 's/\\n//g')
fi

if ! grep -qFx "$OUTPUT" "$DOTFILES_ENV_EXAMPLE"; then
    message_error "Invalid env variable selected. Exiting..."
    dd 1
fi

if [ -n "$OUTPUT" ]; then
  echo -n "$OUTPUT" >"$DOTFILES_ENV_FILE"
fi
message_done "Env setup done."
