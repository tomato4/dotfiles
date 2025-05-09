#!/bin/bash

export INSTALLER_BREW="brew install"
export CHECKER_BREW="brew list"
export INSTALLER_YAY="yay -S --answerdiff None --answerclean None --nocleanmenu --nodiffmenu --removemake"
export CHECKER_YAY="yay -Q"
export INSTALLER_PACMAN="pacman -S --needed --noconfirm"
export CHECKER_PACMAN="pacman -Q"
export INSTALLER_APT="sudo apt install -q -y"
export CHECKER_APT="dpkg -s"
export INSTALLER_SNAP="snap install"
export CHECKER_SNAP="snap list"

if [[ $IS_MAC -eq 0 ]]; then
  INSTALLER=$INSTALLER_BREW
  CHECKER=$CHECKER_BREW
elif command -v yay &>/dev/null; then
  INSTALLER=$INSTALLER_YAY
  CHECKER=$CHECKER_YAY
elif command -v apt &>/dev/null; then
  INSTALLER=$INSTALLER_APT
  CHECKER=$CHECKER_APT
elif command -v pacman &>/dev/null; then
  INSTALLER=$INSTALLER_PACMAN
  CHECKER=$CHECKER_PACMAN
else
  message_error "No supported package manager found. Exiting..."
  dd 1
fi
export INSTALLER
export CHECKER

__install() {
  local installer="$1"
  shift
  local checker="$1"
  shift
  for pkg in "$@"; do
    if $checker "$pkg" >/dev/null 2>&1; then
      message_info "$SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$pkg$SETUP_COLOR_RESET already installed. Skipping..."
    else
      message_info "Installing $SETUP_COLOR_YELLOW$SETUP_FORMATING_BOLD$pkg$SETUP_COLOR_RESET."
      $installer "$pkg"
    fi
  done
}
export -f __install

install() {
  # shellcheck disable=SC2068
  __install "$INSTALLER" "$CHECKER" $@
}
export -f install

###################################################
#              Arch based installers              #
###################################################
install_yay() {
  command -v yay >/dev/null || return
  # shellcheck disable=SC2068
  __install "$INSTALLER_YAY" "$CHECKER_YAY" $@
}
export -f install_yay

install_pacman() {
  command -v pacman >/dev/null || return
  # shellcheck disable=SC2068
  __install "$INSTALLER_PACMAN" "$CHECKER_PACMAN" $@
}
export -f install_pacman

install_pamac() {
  message_warn "Pamac install function is deprecated. Using YAY install instead."
  # shellcheck disable=SC2068
  install_yay $@
}
export -f install_pamac

###################################################
#        Ubuntu based installers (and snap)       #
###################################################

install_apt() {
  command -v apt >/dev/null || return
  # shellcheck disable=SC2068
  __install "$INSTALLER_APT" "$CHECKER_APT" $@
}
export -f install_apt

install_snap() {
  command -v snap >/dev/null || return
  # shellcheck disable=SC2068
  __install "$INSTALLER_SNAP" "$CHECKER_SNAP" $@
}
export -f install_snap

###################################################
#             MacOS based installers              #
###################################################

install_brew() {
  command -v brew >/dev/null || return
  # shellcheck disable=SC2068
  __install "$INSTALLER_BREW" "$CHECKER_BREW" $@
}
export -f install_brew
