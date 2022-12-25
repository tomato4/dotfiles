install_pacman ksshaskpass

# remove old askpass
file_remove_content /etc/sudo.conf "Path askpass /usr/bin/qt4-ssh-askpass"

file_add_content /etc/sudo.conf "Path askpass /usr/bin/ksshaskpass"
