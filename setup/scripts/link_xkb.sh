message_info "Applying my keyboard settings."

sudo rm -f /usr/share/X11/xkb/symbols/cz
sudo ln -s $DOTFILES_XKB/cz_modified /usr/share/X11/xkb/symbols/cz

sudo rm -f /usr/share/X11/xkb/rules/base.xml
sudo ln -s $DOTFILES_XKB/base.xml /usr/share/X11/xkb/rules/base.xml

sudo rm -f /etc/X11/xorg.conf.d/00-keyboard.conf
sudo ln -s $DOTFILES_XKB/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

setxkbmap -model pc104 -layout cz -variant my-layout
message_done "Linked my keyboard settings."

