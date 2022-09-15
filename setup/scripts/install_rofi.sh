install_yay rofi
link $DOTFILES/rofi $CONFIG/rofi

mkdir -p $LOCAL_SHARE/rofi
link $DOTFILES/rofi-themes-collection/themes $LOCAL_SHARE/rofi/themes
