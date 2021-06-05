message_info "Linking dunst config file."
rm -rf $CONFIG/dunst/
ln -s $DOTFILES/dunst $CONFIG/dunst
message_done "Dunst config linked."
