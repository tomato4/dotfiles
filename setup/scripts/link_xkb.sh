message_info "Applying my keyboard settings."
sudo rm -f /usr/share/X11/xkb/symbols/cz
sudo ln -s $DOTFILES_XKB/my_cz /usr/share/X11/xkb/symbols/cz
setxkbmap cz -model pc105
message_done "Linked my keyboard settings."

