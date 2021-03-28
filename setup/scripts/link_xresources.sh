message_info "Linking Xresources."
if ! [[ -f $DOTFILES_CONFIGS/Xresources/.Xresources_$DOTFILES_ENV ]]
then
   message_error "Xresources for '$DOTFILES_ENV' not found. This request will be ignored."
   return
fi

rm $SETUP_HOME/.Xresources 2> /dev/null
ln -s $DOTFILES_CONFIGS/Xresources/.Xresources_$DOTFILES_ENV $SETUP_HOME/.Xresources

message_done "Linked Xresources."
