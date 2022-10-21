message_info "Installing latte-dock"

install_yay "latte-dock-git"

message_info "Linking config files"

rm -rf $CONFIG/latte/
ln -s $DOTFILES/latte-dock/latte $CONFIG/latte
rm -f $CONFIG/lattedockrc
ln -s $DOTFILES/latte-dock/lattedockrc $CONFIG/lattedockrc

message_done "Latte dock installed and set up"
