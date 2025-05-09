install neovim
install_pacman xsel

link "$DOTFILES/nvim" "$CONFIG/nvim"
message_done "Linked neovim config folder."

"$DOTFILES_SETUP/scripts/setup_nvim_plug.sh"
# TODO check the askpass
#source $DOTFILES_SETUP/scripts/setup_askpass.sh
