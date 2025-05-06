#!/bin/bash

confirm() {
  echo -en "$SETUP_COLOR_ORANGE$SETUP_FORMATING_BOLD[WARN]$SETUP_COLOR_RESET $1"
  read -p " [y/n]: "$reply -n 1 -r </dev/tty
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    return 1
  fi
  return 0
}
export -f confirm

stop() {
  read -rsn1 -p $'Press any key to continue...\n' </dev/tty
}
export -f stop

input() {
  read -p "$1"": " reply </dev/tty
  echo $reply
}
export -f input

dd() {
  read -n1 -s -r -p $'Press any key to exit...\n' key
  if [ -z "$1" ]; then
    exit 0
  else
    exit $1
  fi
}
export -f dd

is_x11() {
  if [ "$XDG_SESSION_TYPE" = "x11" ]; then
    return 0
  fi
  return 1
}
export -f is_x11

is_wayland() {
  if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    return 0
  fi
  return 1
}
export -f is_wayland

ask_rofi() {
  echo -n $@ | sed 's/ /\n/g' | rofi -dmenu -format 's\n' 2>/dev/null | sed 's/\\n//g'
}
export -f ask_rofi

ask_rofi_multi() {
  echo -n $@ | sed 's/ /\n/g' | rofi -dmenu -multi-select -format 's\n' 2>/dev/null | sed 's/\\n//g'
}
export -f ask_rofi_multi

get_all_files() {
  for file in $1/*; do basename -- "$file"; done
}
export -f get_all_files

link() {
  rm -rf "$2"
  ln -s "$1" "$2"
}
export -f link

sudo_link() {
  sudo rm -rf "$2"
  sudo ln -s "$1" "$2"
}
export -f sudo_link

# removes content from file
file_remove_content() {
  if [[ $# != 2 ]]; then
    echo "Invalid argument count."
    return 1
  fi

  if ! [[ -f $1 ]]; then
    printf "File '%s' does not exists.\n" "$1"
    return 1
  fi

  # ignore if file does not contain requested string
  grep -q "^$2$" "$1" || return 0

  if [[ -w $1 ]]; then
    grep -v "^$2$" "$1" | tee "$1" >/dev/null
  else
    grep -v "^$2$" "$1" | sudo tee "$1" >/dev/null
  fi
}
export -f file_remove_content

# adds content to file, if not already in file
file_add_content() {
  if [[ $# != 2 ]]; then
    echo "Invalid argument count."
    return 1
  fi

  if ! [[ -f $1 ]]; then
    printf "File '%s' does not exists.\n" "$1"
    return 1
  fi

  # ignore if file contains requested string
  grep -q "^$2$" "$1" && return 0

  if [[ -w $1 ]]; then
    echo "$2" | tee -a "$1" >/dev/null
  else
    echo "$2" | sudo tee -a "$1" >/dev/null
  fi
}
export -f file_add_content

check(){
    if ! which "$1" > /dev/null 2>&1
    then
        message_error "$1 is not installed. Exiting..."
        dd 1
    fi
}
export -f check

install() {
  if [[ $IS_MAC -eq 0 ]]; then
    install_brew $@
  else
    install_yay $@
  fi
}
export -f install

install_pacman() {
  if [[ $IS_MAC -eq 0 ]]; then
      message_error "Install pacman function is only for Linux. Exiting..."
      dd 1
  fi
  for arg in "$@"; do
    if pacman -Q $arg >/dev/null 2>&1; then
      message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
      continue
    fi
    message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
    sudo pacman -S --needed --noconfirm $arg >/dev/null
  done
}
export -f install_pacman

install_yay() {
  if [[ $IS_MAC -eq 0 ]]; then
      message_error "Install yay function is only for Linux. Exiting..."
      dd 1
  fi
  for arg in "$@"; do
    if yay -Q $arg >/dev/null 2>&1; then
      message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
      continue
    fi
    message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
    yay -S --answerdiff None --answerclean None --nocleanmenu --nodiffmenu --removemake $arg </dev/tty
  done
}
export -f install_yay

install_pamac() {
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
export -f install_pamac

install_snap() {
  if [[ $IS_MAC -eq 0 ]]; then
    message_error "Install snap function is only for Linux. Exiting..."
    dd 1
  fi
  if ! confirm "Installing $@ from snap (not recommended). Do you really want to continue?"; then
    return
  fi
  for arg in "$@"; do
    if [[ $(snap list $arg) ]]; then
      message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
      continue
    fi
    message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
    sudo snap install $arg >/dev/null
  done
}
export -f install_snap

install_brew() {
  if [[ $IS_MAC -eq 1 ]]; then
    message_error "Install brew function is only for MacOS. Exiting..."
    dd 1
  fi
  for arg in "$@"; do
    if [[ $(brew list "$arg" 2>/dev/null) ]]; then
      message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET already installed. Skipping..."
      continue
    fi
    message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$arg$SETUP_COLOR_RESET."
    brew install "$arg" >/dev/null
  done
}
export -f install_brew
