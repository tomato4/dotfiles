#!/bin/bash

message_info "Installing Fastfetch"

if [[ $IS_DEBIAN_BASED -ne 0 ]]; then
  install_yay fastfetch-git
  install_brew fastfetch
  exit
fi

message_warn "Installing fastfetch on Debian based system doesn't use apt."

set -e

GITHUB_REPO="fastfetch-cli/fastfetch"
TMP_DIR=$(mktemp -d)
# Detect system architecture
ARCH=$(uname -m)

# Determine the latest version from GitHub
get_latest_version() {
  curl -s "https://api.github.com/repos/$GITHUB_REPO/releases/latest" |
    grep -Po '"tag_name": "\K[^\"]+'
}

# Get currently installed version (if any)
get_installed_version() {
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch --version | awk '{print $2}'
  else
    echo "none"
  fi
}

# Compare two versions: returns 0 if version1 < version2
version_lt() {
  dpkg --compare-versions "$1" lt "$2"
}

# Main
latest_version=$(get_latest_version)
installed_version=$(get_installed_version)

message_info "Installed version: $installed_version"
message_info "Latest version:    $latest_version"

if [[ "$installed_version" == "none" ]] || version_lt "$installed_version" "$latest_version"; then
  message_info "Installing or upgrading Fastfetch to $latest_version..."

  FILE_NAME="fastfetch-linux-$ARCH.deb"
  DEB_URL="https://github.com/$GITHUB_REPO/releases/download/$latest_version/$FILE_NAME"
  DEB_PATH="$TMP_DIR/$FILE_NAME"

  message_info "Downloading from: $DEB_URL"
  curl -L "$DEB_URL" -o "$DEB_PATH"

  message_info "Installing package..."
  sudo apt install -y "$DEB_PATH"

  message_done "Fastfetch $latest_version installed successfully."
else
  message_done "Fastfetch is up to date. No action needed."
fi

rm -rf "$TMP_DIR"
message_done "Fastfetch installation script completed."
