message_info "Installing ZSH"

install zsh zsh-syntax-highlighting zsh-autosuggestions eza
install_linux_mac fastfetch-git fastfetch

link $DOTFILES_ZSH/.zshrc $SETUP_HOME/.zshrc
link $DOTFILES_ZSH/.p10k.zsh $SETUP_HOME/.p10k.zsh

[ "$SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh < /dev/tty

message_done "ZSH setup done"
