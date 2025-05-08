#!/bin/bash

install_and_check(){
    CMD=$1
    PKG=$2

    if [ -z "$PKG" ]
    then
        PKG=$CMD
    fi

    install $PKG
    check_and_dd $CMD
}

message_info "Checking requirements for setup scripts."

if [[ $IS_MAC -eq 0 ]]; then
  message_info "Mac detected. Checking requirements."
  if ! check brew
  then
      message_error "Brew is not installed. Exiting..."
      dd 1
  fi
  if ! check python
  then
    install_brew python
  fi
elif command -v pacman &>/dev/null; then
  message_info "Arch based linux detected. Checking requirements."
  install yay
  install rofi
  if ! check pkgconf
  then
      install_and_check pkgconf base-devel
  fi
  install_and_check python3 python
elif command -v apt &>/dev/null; then
  message_info "Debian based linux detected. Checking requirements."
  install_and_check python3
else
  message_error "No supported package manager found. Exiting..."
  dd 1
fi

for file in $DOTFILES_SETUP/scripts/*
do
   chmod +x $file
done

message_done "Requirements done."
