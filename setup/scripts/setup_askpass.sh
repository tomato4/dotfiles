install_pacman openssh-askpass

if ! [[ $(cat /etc/sudo.conf | grep "^Path askpass /usr/bin/qt4-ssh-askpass$") ]]
then
    echo "Path askpass /usr/bin/qt4-ssh-askpass" | sudo tee -a /etc/sudo.conf
    message_done "Wrote askpass settings to sudo.conf."
fi

