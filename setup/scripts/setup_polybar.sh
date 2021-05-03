message_info "Installing polybar and dependencies."
sudo pacman -S --needed --noconfirm polybar > /dev/null
sudo pacman -S --needed --noconfirm ttf-polybar-icons > /dev/null
sudo pamac install --no-confirm polybar-spotify-listener > /dev/null
sudo pamac install --no-confirm ttf-weather-icons > /dev/null
sudo pamac install --no-confirm ttf-font-awesome > /dev/null
systemctl --user enable spotify-listener
systemctl --user start spotify-listener

message_info "Linking config file."
rm -rf $CONFIG/polybar
ln -s $DOTFILES/polybar $CONFIG/polybar
message_done "Polybar setup finished."
