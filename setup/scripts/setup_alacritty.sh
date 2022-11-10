message_info "Installing alacritty and Hack Nerd Font."
install_yay alacritty ttf-hack-nerd

message_info "Linking config file."
rm -rf $CONFIG/alacritty
ln -s $DOTFILES/alacritty $CONFIG/alacritty

message_done "Alacritty setup finished."
