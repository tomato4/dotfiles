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
      if [[ $(pamac search -a --installed $arg) ]]
      then
         message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
         continue
      fi
      message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
      sudo pamac install --no-confirm $arg > /dev/null
   done
}

install_snap(){
   for arg in "$@"
   do
      if [[ $(snap list $arg) ]]
      then
         message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
         continue
      fi
      message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
      sudo snap install $arg > /dev/null
   done
}

confirm(){
   echo -en "$SETUP_COLOR_ORANGE$SETUP_FORMATING_BOLD[WARN]$SETUP_COLOR_RESET $1"
   read -p " [y/n]: "$reply -n 1 -r < /dev/tty
   echo
   if [[ ! $REPLY =~ ^[Yy]$ ]]
   then
      return 1
   fi
   return 0
}
