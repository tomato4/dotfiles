message_info "Preparing git configuration."

if ! confirm "This will delete global .gitconfig file. Do you want to continue?"
then
    return
fi

rm -f $SETUP_HOME/.gitconfig
cp $DOTFILES/.gitconfig $SETUP_HOME/.gitconfig
message_done "Copied gitconfig file for global git configuration."
echo -n "Please write your name for global git configuration: "; read name < /dev/tty; git config --global user.name "$name"
echo -n "Please write your email for global git configuration: "; read email < /dev/tty; git config --global user.email "$email"
message_done "Git setup completed."
