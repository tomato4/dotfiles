install_pacman neovim xsel

rm -rf $CONFIG/nvim
ln -s $DOTFILES/nvim $CONFIG/nvim
message_done "Linked neovim config folder."

source $DOTFILES_SETUP/scripts/setup_nvim_plug.sh
source $DOTFILES_SETUP/scripts/setup_askpass.sh
source $DOTFILES_SETUP/scripts/install_nodejs.sh
