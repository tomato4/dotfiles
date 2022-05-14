message_info "Installing ZSH"

install_yay zsh zsh-syntax-highlighting zsh-autosuggestions

rm -f $SETUP_HOME/.zshrc
ln -s $DOTFILES/zsh/.zshrc $SETUP_HOME/.zshrc
rm -f $SETUP_HOME/.zshlogin
ln -s $DOTFILES/zsh/.zshlogin $SETUP_HOME/.zshlogin
rm -f $SETUP_HOME/.p10k.zsh
ln -s $DOTFILES/zsh/.p10k.zsh $SETUP_HOME/.p10k.zsh

[ "$SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh < /dev/tty

message_done "ZSH setup done"
