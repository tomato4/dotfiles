message_info "Installing ZSH"

install zsh zsh-syntax-highlighting zsh-autosuggestions fastfetch-git eza

rm -f $SETUP_HOME/.zshrc
ln -s $DOTFILES_ZSH/.zshrc $SETUP_HOME/.zshrc
rm -f $SETUP_HOME/.p10k.zsh
ln -s $DOTFILES_ZSH/.p10k.zsh $SETUP_HOME/.p10k.zsh

[ "$SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh < /dev/tty

message_done "ZSH setup done"
