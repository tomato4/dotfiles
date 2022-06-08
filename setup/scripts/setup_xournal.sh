install_pacman xournalpp

rm -rf $SETUP_HOME/.xournalpp
ln -s $DOTFILES/xournal $SETUP_HOME/.xournalpp

rm -rf $CONFIG/xournalpp
ln -s $DOTFILES/xournal $CONFIG/xournalpp
message_done "Xournal setup done."
