message_info "Installing dragon (Drag&Drop)"
install_pacman clang
cd $DOTFILES_PROGRAMS/dragon/
make > /dev/null
make install > /dev/null
message_done "Installed dragon."
cd $DOTFILES_SETUP
