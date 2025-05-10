message_info "Downloading nvim plug manager."
sh -c "curl -fLo ${SETUP_HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > /dev/null
message_done "Downloaded plug manager."

message_info "Downloading node.js for coc.nvim."
"$DOTFILES_SETUP_SCRIPTS/install_nodejs.sh"
#sudo curl -sL install-node.now.sh/lts | sudo bash
message_done "Installed node.js."

message_info "Installing pynvim and ueberzug for rnvimr..."
if [[ $IS_DEBIAN_BASED -eq 0 ]]; then
  install_apt python3-pynvim
else
  pip3 install pynvim ueberzug > /dev/null
fi
message_done "Installed pynvim and ueberzug."

install_apt python3-venv

#message_info "Installing Jedi for python."
#pip install jedi-language-server
#message_done "Installed Jedi."
