message_info "Installing php and apache."
message_warn "There could be problem with key signatures. If so, install via pamac gui php56 and other php56 dep. This should add these keys."
#sudo pamac install --no-confirm apache php php-apache php-cgi php-fpm php-gd php-intl php-pgsql php56 php56-apache php56-cgi php56-fpm php56-gd php56-intl php56-sqlite > /dev/null
sudo pacman -S --noconfirm --needed apache php56-apache php56 php7 php7-fpm php7-gd php7-intl php7-pgsql phpmyadmin
sudo pamac install --no-confirm php72 php72-apache php72-cgi php72-dblib php72-fpm php72-gd php72-intl php72-odbc php72-pgsql php72-sqlite php72-xsl
message_done "Installed apache and php56/72."

