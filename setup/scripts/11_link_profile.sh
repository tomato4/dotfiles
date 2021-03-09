message_info "Linking profile."
rm -f ~/.profile
ln -s $DOTFILES/.profile ~/.profile
message_done "Profile's symlink created."
