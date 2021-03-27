message_info "Installing i3blocks."
sudo pamac install --no-confirm i3blocks > /dev/null
message_done "Installed i3blocks."
for file in $DOTFILES_I3BLOCK/scripts/*
do
   chmod +x $file
done

CONFIG_FILE="config_$DOTFILES_ENV"
if ! [[ -f $DOTFILES_I3BLOCK/$CONFIG_FILE ]]
then
   CONFIG_FILE="config_default"
fi
rm $DOTFILES_I3BLOCK/config 2> /dev/null
ln -s $DOTFILES_I3BLOCK/$CONFIG_FILE $DOTFILES_I3BLOCK/config

rm -rf $CONFIG/i3blocks
ln -s $DOTFILES/i3blocks $CONFIG/i3blocks
message_done "Linked i3blocks config folder."

