message_info "Installing alacritty."
sudo pacman -S alacritty > /dev/null
message_info "Linking config file."
rm -rf $CONFIG/alacritty
ln -s $DOTFILES/alacritty $CONFIG/alacritty
message_done "Alacritty setup finished."
