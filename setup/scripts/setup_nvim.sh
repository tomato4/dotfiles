message_info "Installing neovim."
sudo pacman -S --needed --noconfirm neovim > /dev/null
message_done "Installed neovim."
rm -rf $CONFIG/nvim
ln -s $DOTFILES/nvim $CONFIG/nvim
message_done "Linked neovim config folder."

