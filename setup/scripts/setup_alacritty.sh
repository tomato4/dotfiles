message_info "Installing alacritty and Hack Nerd Font."
sudo pacman -S --needed --noconfirm alacritty > /dev/null
sudo pamac install nerd-fonts-hack --no-confirm > /dev/null
sudo pamac install python36 --no-confirm > /dev/null # for crypto script
message_info "Linking config file."
rm -rf $CONFIG/alacritty
ln -s $DOTFILES/alacritty $CONFIG/alacritty
message_done "Alacritty setup finished."
