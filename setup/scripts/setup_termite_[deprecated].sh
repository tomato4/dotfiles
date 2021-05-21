install_pacman termite
rm -rf $CONFIG/termite
ln -s $DOTFILES/termite $CONFIG/termite
message_done "Linked termite config folder."
