message_info "Installing php and apache."
message_warn "There could be problem with key signatures. If so, install via pamac gui php56 and other php56 dep. This should add these keys."

# gpg keys for php 5.6
message_info "Adding keyserver for php keys."
if ! [[ $(sudo cat $SETUP_HOME/.gnupg/gpg.conf | egrep "keyserver\s+keyserver.ubuntu.com") ]]
then
   echo "keyserver keyserver.ubuntu.com" | sudo tee -a $SETUP_HOME/.gnupg/gpg.conf
fi

#install_pacman apache php7 php7-fpm php7-gd php7-intl php7-pgsql phpmyadmin
install_pamac php56-apache php56 php74 php74-apache php74-dblib php74-fpm php74-gd php74-intl php74-xsl
sudo ln -s /usr/bin/php74 /usr/bin/php
message_done "Installed apache and php56/72."

