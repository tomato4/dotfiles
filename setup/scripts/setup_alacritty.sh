message_info "Installing alacritty and Hack Nerd Font."
sudo pacman -S --needed --noconfirm alacritty > /dev/null
sudo pamac install nerd-fonts-hack --no-confirm > /dev/null
sudo pamac install python36 --no-confirm > /dev/null # for crypto script
curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6 # install pip for python 3.6
pip3.6 install requests # crypto
message_info "Linking config file."
rm -rf $CONFIG/alacritty
ln -s $DOTFILES/alacritty $CONFIG/alacritty
message_done "Alacritty setup finished."
