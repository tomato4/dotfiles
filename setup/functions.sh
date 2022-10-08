#!/bin/bash

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

input(){
    read -p "$1"": " reply < /dev/tty
    echo $reply
}

dd(){
    read -n1 -s -r -p $'Press any key to exit...\n' key
    if [ -z "$1" ]
    then
        exit 0
    else
        exit $1
    fi
}

ask_rofi(){
    echo -n $@ | sed 's/ /\n/g' | rofi -dmenu -format 's\n' 2> /dev/null | sed 's/\\n//g'
}

ask_rofi_multi(){
    echo -n $@ | sed 's/ /\n/g' | rofi -dmenu -multi-select -format 's\n' 2> /dev/null | sed 's/\\n//g'
}

get_all_files(){
    for file in $1/*; do echo "$(basename $file)"; done
}

link(){
    rm -f $2
    ln -s $1 $2
}

install(){
    install_yay $@
}

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

install_yay(){
   for arg in "$@"
   do
      if yay -Q $arg > /dev/null 2>&1
      then
         message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
         continue
      fi
      message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
      yay -S --answerdiff None --answerclean None --nocleanmenu --nodiffmenu --removemake $arg < /dev/tty
   done
}

install_pamac(){
    message_warn "Pamac install function is deprecated. Using YAY install instead."
    install_yay $@
    return
   # for arg in "$@"
   # do
   #    if [[ $(pamac search -a --installed $arg) ]]
   #    then
   #       message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
   #       continue
   #    fi
   #    message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
   #    sudo pamac install --no-confirm $arg > /dev/null
   # done
}

install_snap(){
    if ! confirm "Installing $@ from snap (not recommended). Do you really want to continue?"
    then
        return
    fi
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

