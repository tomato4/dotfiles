install_pacman ranger
rm -rf $CONFIG/ranger
ln -s $DOTFILES/ranger $CONFIG/ranger
message_done "Linked ranger config folder."

