message_info "Installing mariadb, phpmyadmin"
install_pacman mariadb phpmyadmin
message_done "Installed."

if confirm "Run mysql DB init? (This should be only run once!)"
then
    message_info "Init DB"
    sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    sudo systemctl enable mysql --now
    sudo mysql_secure_installation < /dev/tty

    user='tomato'
    pwd='12345'
    host=localhost
    command="CREATE USER '${user}'@'${host}' IDENTIFIED BY '${pwd}';GRANT ALL PRIVILEGES ON *.* TO '${user}'@'${host}' IDENTIFIED BY '${pwd}';FLUSH PRIVILEGES;"
    echo "${commands}" | sudo mysql
fi

sudo systemctl enable mysql --now
sudo systemctl restart mysql
