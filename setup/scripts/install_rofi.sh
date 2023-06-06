if is_wayland
then
    install rofi-lbonn-wayland-git
else
    install rofi
fi

link $DOTFILES/rofi $CONFIG/rofi

mkdir -p $LOCAL_SHARE/rofi
link $DOTFILES/rofi-themes-collection/themes $LOCAL_SHARE/rofi/themes
