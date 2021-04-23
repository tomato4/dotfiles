message_info "Linking picom config file."
rm -f $CONFIG/picom.conf
ln -s $DOTFILES/picom/picom.conf $CONFIG/picom.conf
message_done "Linked picom config."
