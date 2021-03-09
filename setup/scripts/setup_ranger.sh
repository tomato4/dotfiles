message_info "Installing ranger."
sudo pacman -S --needed --noconfirm ranger > /dev/null
message_done "Installed ranger."
rm -rf $CONFIG/ranger
ln -s $DOTFILES/ranger $CONFIG/ranger
message_done "Linked ranger config folder."

