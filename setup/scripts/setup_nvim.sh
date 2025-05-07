install neovim
install_pacman xsel

rm -rf $CONFIG/nvim
ln -s $DOTFILES/nvim $CONFIG/nvim
message_done "Linked neovim config folder."

source $DOTFILES_SETUP/scripts/setup_nvim_plug.sh
# TODO check the askpass
#source $DOTFILES_SETUP/scripts/setup_askpass.sh
