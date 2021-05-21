install_pacman fish fastfetch

rm -rf $CONFIG/fish
ln -s $DOTFILES/fish $CONFIG/fish

message_done "Fish setup completed."
