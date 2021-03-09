message_info "Installing composer."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo systemctl restart httpd
sudo composer self-update
message_done "Installed composer."

