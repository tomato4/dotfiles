message_info "Installing polybar and dependencies."
sudo pacman -S --needed --noconfirm polybar > /dev/null
sudo pacman -S --needed --noconfirm ttf-polybar-icons > /dev/null
sudo pacman -S --needed --noconfirm 
message_info "Linking config file."
rm -rf $CONFIG/polybar
ln -s $DOTFILES/polybar $CONFIG/polybar
message_done "Polybar setup finished."
