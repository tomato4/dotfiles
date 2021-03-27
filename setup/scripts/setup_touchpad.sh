message_info "Linking touchpad setup."
sudo rm -f /etc/X11/xorg.conf.d/30-touchpad.conf
sudo ln -s $DOTFILES_CONFIGS/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
message_done "Linked touchpad setup."
