message_info "Installing php and apache."
message_warn "There could be problem with key signatures. If so, install via pamac gui php56 and other php56 dep. This should add these keys."
sudo pamac install --no-confirm apache php php-apache php-cgi php-fpm php-gd php-intl php-pgsql php56 php56-apache php56-cgi php56-fpm php56-gd php56-intl php56-sqlite > /dev/null
message_done "Installed apache and php56/72."

