install_pacman fish fastfetch

rm -rf $CONFIG/fish
ln -s $DOTFILES/fish $CONFIG/fish

message_info "Installing Oh My Fish."
curl -L https://get.oh-my.fish | fish

message_done "Fish setup completed."
