message_info "Installing polybar and dependencies."
install_pacman polybar ttf-polybar-icons
install_pamac polybar-spotify-listener ttf-weather-icons python36

systemctl --user enable spotify-listener
systemctl --user start spotify-listener

curl https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6 # install pip for python 3.6
pip3.6 install requests

message_info "Linking config file."
rm -rf $CONFIG/polybar
ln -s $DOTFILES/polybar $CONFIG/polybar
message_done "Polybar setup finished."
