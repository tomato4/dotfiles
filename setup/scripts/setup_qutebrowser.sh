install_pacman qutebrowser

message_info "Linking config folder with bookmarks and setup."
rm -rf $CONFIG/qutebrowser
ln -s $DOTFILES/qutebrowser $CONFIG/qutebrowser
message_done "Linked folder."
