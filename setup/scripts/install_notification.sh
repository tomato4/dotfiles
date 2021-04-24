message_info "Installing deadd-notification-center and notify-send.py."
sudo pamac install --no-confirm deadd-notification-center-bin > /dev/null
pip install notify-send.py > /dev/null
message_info "Linking config file."
rm -rf $CONFIG/deadd
ln -s $DOTFILES/deadd $CONFIG/deadd
message_done "Setup done."
