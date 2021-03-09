message_info "Linking conky config."
sudo rm -f /usr/share/conky/conky_green
sudo ln -s $DOTFILES/conky/conky_green /usr/share/conky/conky_green
message_done "Linked config file."

