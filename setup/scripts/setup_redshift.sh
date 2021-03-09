message_info "Installing redshift"
sudo pacman -S --needed --noconfirm redshift > /dev/null
message_done "Installed redshift."
rm -rf $CONFIG/redshift
ln -s $DOTFILES/redshift $CONFIG/redshift
message_done "Linked redshift config folder."

