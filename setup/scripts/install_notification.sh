message_info "Installing deadd-notification-center and notify-send.py."
install_pamac deadd-notification-center-bin
pip install notify-send.py > /dev/null
message_info "Linking config file."
rm -rf $CONFIG/deadd
ln -s $DOTFILES/deadd $CONFIG/deadd
message_done "Setup done."
