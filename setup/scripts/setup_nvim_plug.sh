message_info "Downloading nvim plug manager."
sh -c "curl -fLo ${SETUP_HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > /dev/null
message_done "Downloaded plug manager."

message_info "Downloading node.js for coc.nvim."
sudo curl -sL install-node.now.sh/lts | sudo bash
message_done "Installed node.js."

message_info "Installing pynvim and ueberzug for rnvimr..."
pip3 install pynvim > /dev/null
pip3 install ueberzug > /dev/null
message_done "Installed pynvim and ueberzug."

message_info "Installing Jedi for python."
pip install jedi-language-server
message_done "Installed Jedi."
