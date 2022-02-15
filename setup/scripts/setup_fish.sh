install_yay fish fastfetch-git exa

rm -rf $CONFIG/fish
ln -s $DOTFILES/fish $CONFIG/fish

if ! [ -f "$DOTFILES/fish/conf.d/omf.fish" ]
then
    message_info "Installing Oh My Fish."
    curl -L https://get.oh-my.fish | fish
else
    message_done "OMF already installed..."
fi

fish -c "omf install bobthefish"
fish -c "omf theme bobthefish"

chsh -s /usr/bin/fish < /dev/tty

message_done "Fish setup completed."
