message_info "Installing alacritty and Hack Nerd Font."
install_pacman alacritty
install_pamac nerd-fonts-hack
message_info "Linking config file."
rm -rf $CONFIG/alacritty
ln -s $DOTFILES/alacritty $CONFIG/alacritty
message_done "Alacritty setup finished."
