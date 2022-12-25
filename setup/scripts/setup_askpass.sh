install_pacman ksshaskpass

if grep -q "^Path askpass /usr/bin/qt4-ssh-askpass$" /etc/sudo.conf
then
    grep -v "^Path askpass /usr/bin/qt4-ssh-askpass$" /etc/sudo.conf | sudo tee /etc/sudo.conf >/dev/null
    message_info "Removed old qt4-ssh-askpass."
fi

if ! grep -q "^Path askpass /usr/bin/ksshaskpass$" /etc/sudo.conf
then
    echo "Path askpass /usr/bin/ksshaskpass" | sudo tee -a /etc/sudo.conf >/dev/null
    message_done "Wrote askpass settings to sudo.conf."
fi
