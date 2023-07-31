message_info "Linking pacman conf file."
sudo_link "$DOTFILES/pacman/pacman.conf" /etc/pacman.conf

message_info "Linking pacman mirrorlist."
sudo_link "$DOTFILES/pacman/mirrorlist" /etc/pacman.d/mirrorlist

message_info "Disabling pamac mirrorlist timer (to prevent mirrorlist autoupdates)"
sudo systemctl mask pamac-mirrorlist.timer
