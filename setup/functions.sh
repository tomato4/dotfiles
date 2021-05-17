#!/bin/bash

install_pacman(){
   for arg in "$@"
   do
      if pacman -Q $arg > /dev/null 2>&1
      then
         message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
         continue
      fi
      message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
      sudo pacman -S --needed --noconfirm $arg > /dev/null
   done
}

install_pamac(){
   for arg in "$@"
   do
      if [[ $(pamac search --installed $arg) ]]
      then
         message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
         continue
      fi
      message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
      sudo pamac install --no-confirm $arg > /dev/null
   done
}
