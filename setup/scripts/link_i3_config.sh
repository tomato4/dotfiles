message_info "Compiling and linking i3 config file."

if ! [[ -f $DOTFILES_I3_CONFIGS/$DOTFILES_ENV ]]
then
   message_error "I3 config for '$DOTFILES_ENV' not found!"
   return
fi

cat $DOTFILES_I3/header > $DOTFILES_I3/config

cat $DOTFILES_I3_CONFIGS/$DOTFILES_ENV >> $DOTFILES_I3/config
cat $DOTFILES_I3/base >> $DOTFILES_I3/config
message_done "Created i3 config file."
rm -rf $SETUP_HOME/.i3
ln -s $DOTFILES_I3 $SETUP_HOME/.i3

message_done "I3 config file ready."
