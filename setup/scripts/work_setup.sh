message_info "Starting setup for work enviroment."
mkdir -p $SETUP_HOME/NetBeansProjects
cat $SETUP_HOME/.ssh/id_rsa.pub
read -p "Add ssh key of this pc to bitbucket and then press enter..." < /dev/tty

if [ ! -d $WORK_CME ]
then
   git clone -q git@bitbucket.org:internethandel/cme.git $WORK_CME > /dev/null
fi

if ! [[ $(sudo cat /etc/hosts | egrep "127.0.0.1\s+cme") ]]
then
   echo "127.0.0.1	cme" | sudo tee -a /etc/hosts
fi

sudo mkdir -p /var/log/apache/cme
sudo mkdir -p /etc/httpd/conf/sites-enabled
sudo rm -f /etc/httpd/conf/sites-enabled/001-cme.conf
sudo rm -f /etc/httpd/conf/sites-enabled/000-cme.conf
sudo ln -s $DOTFILES_WORK/001-cme.conf /etc/httpd/conf/sites-enabled/001-cme.conf
sudo rm /etc/httpd/conf/extra/httpd-default.conf
sudo ln -s $DOTFILES_WORK/httpd-default.conf /etc/httpd/conf/extra/httpd-default.conf
sudo rm /etc/php/php.ini
sudo rm /etc/php56/php.ini
sudo ln -s $DOTFILES_WORK/php.ini /etc/php/php.ini
sudo ln -s $DOTFILES_WORK/php56.ini /etc/php56/php.ini
sudo rm /etc/httpd/conf/httpd.conf
sudo ln -s $DOTFILES_WORK/httpd.conf /etc/httpd/conf/httpd.conf
sudo rm -f /etc/httpd/conf/extra/php-fpm.conf
sudo ln -s $DOTFILES_WORK/php-fpm.conf /etc/httpd/conf/extra/php-fpm.conf
sudo rm -f /etc/httpd/conf/extra/httpd-vhosts.conf
sudo ln -s $DOTFILES_WORK/httpd-vhosts.conf /etc/httpd/conf/extra/httpd-vhosts.conf
if ! [[ -f $WORK_CME/inc-local.php ]]
then
   cp $WORK_CME/inc-local.php.example $WORK_CME/inc-local.php
fi
message_warn "Don't forget to setup inc-local file."
message_warn "Running composer install... This action could potentialy fail on composer for php7.2."
cd $WORK_CME/skripty/composer-php56/; composer install; cd ../composer-php72/; composer install
sudo systemctl restart php56-fpm
sudo systemctl restart php-fpm
sudo systemctl restart httpd
message_done "Work env setup done."
