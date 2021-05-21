install_pacman neovim

rm -rf $CONFIG/nvim
ln -s $DOTFILES/nvim $CONFIG/nvim
message_done "Linked neovim config folder."

source $DOTFILES_SETUP/scripts/setup_askpass.sh
