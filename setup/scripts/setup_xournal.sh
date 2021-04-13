message_info "Installing Xournal++"
sudo pacman -S --needed --noconfirm xournalpp > /dev/null

rm -rf $SETUP_HOME/.xournalpp
ln -s $DOTFILES/xournal $SETUP_HOME/.xournalpp
message_done "Xournal setup done."
