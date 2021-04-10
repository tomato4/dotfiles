message_info "Installing Termite."
sudo pacman -S --needed --noconfirm termite > /dev/null
message_done "Installed Termite."
rm -rf $CONFIG/termite
ln -s $DOTFILES/termite $CONFIG/termite
message_done "Linked termite config folder."
