export SETUP_HOME="$HOME"
export PROGRAMS="$SETUP_HOME/Programs"
export CONFIG="$SETUP_HOME/.config"
export LOCAL="$SETUP_HOME/.local"
export LOCAL_SHARE="$LOCAL/share"
export DOTFILES="$SETUP_HOME/dotfiles"
export DOTFILES_SETUP="$DOTFILES/setup"
export DOTFILES_SETUP_SCRIPTS="$DOTFILES_SETUP/scripts"
export DOTFILES_ENV_FILE="$DOTFILES_SETUP/env"
export DOTFILES_CONFIGS="$DOTFILES/configs"
export DOTFILES_I3="$DOTFILES/i3"
export DOTFILES_I3_CONFIGS="$DOTFILES_I3/configs"
export DOTFILES_I3BLOCK="$DOTFILES/i3blocks"
export DOTFILES_BASH="$DOTFILES/bash"
export DOTFILES_PROGRAMS="$DOTFILES/programs"
export DOTFILES_XKB="$DOTFILES/xkb"
export DOTFILES_ZSH="$DOTFILES/zsh"
export WORK_CME="$SETUP_HOME/NetBeansProjects/cme"
export DOTFILES_WORK="$DOTFILES/Work/config"

# KDE configuration
export DOTFILES_KDE="$DOTFILES/kde"
export DOTFILES_KDE_CONFIG="$DOTFILES_KDE/config"

# Apache
export HTTPD="/etc/httpd/conf"
export HTTPD_VHOSTS="$HTTPD/vhosts"
export HTTPD_VHOSTS_ENABLED="$HTTPD/vhosts-enabled"
export DOTFILES_APACHE="$DOTFILES/apache"
export DOTFILES_HTTPD="$DOTFILES_APACHE/httpd"
export PHP="/etc/php"

# OS
export OS="$(uname)"
[[ "$(uname)" == "Darwin" ]]
export IS_MAC=$?

command -v apt &>/dev/null
export IS_DEBIAN_BASED=$?

command -v pacman &>/dev/null
export IS_ARCH_BASED=$?
