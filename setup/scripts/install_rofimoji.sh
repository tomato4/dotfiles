message_info "Installing rofimoji."

if is_wayland
then
    install rofi-lbonn-wayland-git wl-clipboard wtype
else
    install rofi xdotool xsel
fi

install rofimoji noto-fonts-emoji

link $DOTFILES/rofimoji/rofimoji.rc $CONFIG/rofimoji.rc

message_done "Rofimoji installed."
