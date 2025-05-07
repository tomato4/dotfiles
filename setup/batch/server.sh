#!/bin/bash

# Resolve the directory of this script, no matter where it's called from
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to that directory
cd "$SCRIPT_DIR/../" || exit 1

# Call the setup script with relative paths from this directory
./setup.sh setup_zsh.sh setup_nvim.sh setup_ranger.sh
