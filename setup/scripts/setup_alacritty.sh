message_info "Installing alacritty and Hack Nerd Font."
sudo pacman -S --needed --noconfirm alacritty > /dev/null
sudo pamac install nerd-fonts-hack --no-confirm > /dev/null
message_info "Linking config file."
rm -rf $CONFIG/alacritty
ln -s $DOTFILES/alacritty $CONFIG/alacritty
message_done "Alacritty setup finished."
