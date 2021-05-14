message_info "Installing polybar and dependencies."
sudo pacman -S --needed --noconfirm polybar > /dev/null
sudo pacman -S --needed --noconfirm ttf-polybar-icons > /dev/null
sudo pamac install --no-confirm polybar-spotify-listener > /dev/null
sudo pamac install --no-confirm ttf-weather-icons > /dev/null
sudo pamac install --no-confirm ttf-font-awesome > /dev/null
sudo cp $DOTFILES/polybar/modules_binary/polybar-cryptocurrency/coins.otf /usr/share/fonts/Coins.otf
systemctl --user enable spotify-listener
systemctl --user start spotify-listener

sudo pamac install python36 --no-confirm > /dev/null # for crypto script
curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6 # install pip for python 3.6
pip3.6 install requests # crypto

message_info "Linking config file."
rm -rf $CONFIG/polybar
ln -s $DOTFILES/polybar $CONFIG/polybar
message_done "Polybar setup finished."
