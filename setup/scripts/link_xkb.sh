message_info "Applying my keyboard settings."

sudo_link $DOTFILES_XKB/cz_modified /usr/share/X11/xkb/symbols/cz

sudo_link $DOTFILES_XKB/base.xml /usr/share/X11/xkb/rules/base.xml
sudo_link $DOTFILES_XKB/base.lst /usr/share/X11/xkb/rules/base.lst

sudo_link /usr/share/X11/xkb/rules/base.xml /usr/share/X11/xkb/rules/evdev.xml
sudo_link /usr/share/X11/xkb/rules/base.lst /usr/share/X11/xkb/rules/evdev.lst

# sudo rm -f /etc/X11/xorg.conf.d/00-keyboard.conf
# sudo ln -s $DOTFILES_XKB/00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf

if is_x11
then
  setxkbmap -model pc104 -layout cz -variant my-layout
elif is_wayland
then
  message_warn "Applying keyboard layout for Wayland is not configured yet..."
  stop
else
  message_error "Unknown display server protocol. Apply keyboard layout manually!"
  stop
fi

message_done "Linked my keyboard settings."
