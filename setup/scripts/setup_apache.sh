message_info "Installing httpd, composer, php and it's modules"
install_pacman apache composer php php-fpm php-apache php-cgi php-intl
message_done "Installed"

# link vhosts
if ! [ -L "$HTTPD_VHOSTS" ]
then
    sudo ln -s $DOTFILES_HTTPD/vhosts $HTTPD_VHOSTS
fi

# create vhosts-enabled and add default
if ! [ -d "$HTTPD_VHOSTS_ENABLED" ]
then
    sudo mkdir $HTTPD_VHOSTS_ENABLED
    sudo ln -s $HTTPD_VHOSTS/default.conf $HTTPD_VHOSTS_ENABLED/default.conf
fi

# httpd config
sudo rm -f $HTTPD/httpd.conf
sudo ln -s $DOTFILES_HTTPD/httpd.conf $HTTPD/httpd.conf

# autoincludes
if ! [ -L "$HTTPD/includes" ]
then
    sudo ln -s $DOTFILES_HTTPD/includes $HTTPD/includes
fi

# php.ini
sudo rm -f $PHP/php.ini
sudo ln -s $DOTFILES_APACHE/php.ini $PHP/php.ini

# enable some hosts
source $DOTFILES_SETUP/scripts/apache_enable.sh

# restart services
sudo systemctl enable httpd php-fpm --now
sudo systemctl restart httpd php-fpm
