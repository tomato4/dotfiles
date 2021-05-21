install_pacman libinput libinput-gestures gestures
rm -f $CONFIG/libinput-gestures.conf
ln -s $DOTFILES_CONFIGS/libinput-gestures.conf $CONFIG/libinput-gestures.conf
message_info "Setting things up."
sudo gpasswd -a $USER input
libinput-gestures-setup autostart
message_warn "Restart requiered!"
message_done "Gestures finished."
